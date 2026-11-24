#!/usr/bin/env node
/**
 * encrypt_signing_password.js
 *
 * Produces the value that hvigor expects in
 * `signingConfigs[].material.storePassword` / `.keyPassword` of
 * build-profile.json5.
 *
 * Background
 * ----------
 * Since hvigor 5.x these fields are NOT plain passwords.  They are hex
 * encoded AES-128-GCM ciphertexts.  hvigor decrypts them with
 * `DecipherUtil.decryptPwd(<dir containing the .p12>, <hex>)`, which:
 *
 *   1. requires the hex string to be >= 32 chars and of even length
 *      (otherwise: "The length of the storePassword or keyPassword field in
 *       the signature configuration is less than 32." / error 00303116)
 *   2. derives the AES key from a "material" directory that must live next to
 *      the keystore:  <keystore dir>/material/{fd,ac,ce}
 *
 * The material layout mirrors what `SessionIdHelper.createMaterial()` writes:
 *
 *   material/fd/{0,1,2}/<sha256>   three 16-byte key components
 *   material/ac/<sha256>           16-byte PBKDF2 salt
 *   material/ce/<sha256>           AES-128-GCM(rootKey, random 16 bytes)
 *
 * and the actual AES key is the plaintext of `material/ce/<sha256>`.
 *
 * This script is the exact inverse of `DecipherUtil.decryptPwd()`.
 *
 * Usage:
 *   node encrypt_signing_password.js <material-parent-dir> <plain-password>
 *
 *   <material-parent-dir> is the directory that CONTAINS the "material" dir
 *   (i.e. the directory that holds the .p12 file).
 */
const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

// hvigor-ohos-plugin/src/utils/decipher-util.js -> DecipherUtil.component
const COMPONENT = new Int8Array([
  49, 243, 9, 115, 214, 175, 91, 184, 211, 190, 177, 88, 101, 131, 192, 119,
]);
const DIRS = ['fd', 'ac', 'ce'];

function readDirBytes(dir) {
  const entries = fs.readdirSync(dir).filter((e) => e !== '.DS_Store');
  if (entries.length !== 1) {
    throw new Error(`expected exactly 1 entry in ${dir}, got ${entries.length}`);
  }
  return new Int8Array(fs.readFileSync(path.join(dir, entries[0])));
}

function xor(a, b) {
  const out = new Int8Array(a.byteLength);
  for (let i = 0; i < a.byteLength; i++) out[i] = a[i] ^ b[i];
  return out;
}

function xorComponents(list) {
  let acc = xor(list[0], list[1]);
  for (let i = 2; i < list.length; i++) acc = xor(acc, list[i]);
  return Buffer.from(acc);
}

function getRootKey(fdParts, salt) {
  const merged = xorComponents([...fdParts, COMPONENT]);
  return crypto.pbkdf2Sync(merged.toString(), Buffer.from(salt), 10000, 16, 'sha256');
}

/** Exactly DecipherUtil.decrypt() */
function decrypt(key, data) {
  const len = (data[0] << 24) | (data[1] << 16) | (data[2] << 8) | data[3];
  const ivLen = data.length - 4 - len;
  const iv = data.slice(4, 4 + ivLen);
  const decipher = crypto.createDecipheriv('aes-128-gcm', key, iv);
  decipher.setAuthTag(data.slice(data.length - 16));
  return Buffer.concat([
    decipher.update(data.subarray(4 + ivLen, data.length - 16)),
    decipher.final(),
  ]);
}

/** Exactly SessionIdHelper.encrypt() */
function encrypt(key, data) {
  const iv = new Int8Array(crypto.randomBytes(12));
  const cipher = crypto.createCipheriv('aes-128-gcm', key, iv);
  const body = new Int8Array(Buffer.concat([cipher.update(data), cipher.final()]));
  const tag = new Int8Array(cipher.getAuthTag());
  const payloadLen = body.length + tag.length;
  const out = new Int8Array(4 + iv.length + body.length + tag.length);
  out[0] = (payloadLen >> 24) & 255;
  out[1] = (payloadLen >> 16) & 255;
  out[2] = (payloadLen >> 8) & 255;
  out[3] = 255 & payloadLen;
  for (let i = 0; i < iv.length; i++) out[i + 4] = iv[i];
  for (let i = 0; i < body.length; i++) out[i + 16] = body[i];
  const tagOffset = 4 + iv.length + body.length;
  for (let i = 0; i < tag.length; i++) out[i + tagOffset] = tag[i];
  return Buffer.from(out);
}

/** Exactly DecipherUtil.getKey() */
function getKey(baseDir) {
  const materialDir = path.resolve(baseDir, 'material');
  const fdRoot = path.resolve(materialDir, DIRS[0]);
  const fdSub = fs.readdirSync(fdRoot).filter((d) => d !== '.DS_Store');
  const fdParts = fdSub.map((d) => readDirBytes(path.join(fdRoot, d)));
  const salt = readDirBytes(path.resolve(materialDir, DIRS[1]));
  const rootKey = getRootKey(fdParts, salt);
  const work = readDirBytes(path.resolve(materialDir, DIRS[2]));
  return new Int8Array(decrypt(rootKey, work));
}

function encryptPwd(baseDir, plainPassword) {
  const key = getKey(baseDir);
  return encrypt(key, Buffer.from(plainPassword, 'utf-8')).toString('hex');
}

module.exports = { encryptPwd, getKey, encrypt, decrypt };

if (require.main === module) {
  const [, , baseDir, password] = process.argv;
  if (!baseDir || !password) {
    console.error('usage: node encrypt_signing_password.js <material-parent-dir> <plain-password>');
    process.exit(2);
  }
  const hex = encryptPwd(baseDir, password);

  // self-check: the produced hex must round-trip through the decryptor
  const back = decrypt(getKey(baseDir), new Int8Array(Buffer.from(hex, 'hex'))).toString('utf-8');
  if (back !== password) {
    console.error(`SELF CHECK FAILED: decrypted back to ${JSON.stringify(back)}`);
    process.exit(1);
  }
  if (hex.length < 32 || hex.length % 2 !== 0) {
    console.error(`SELF CHECK FAILED: hex length ${hex.length} violates hvigor constraints`);
    process.exit(1);
  }
  console.log(hex);
}
