#!/usr/bin/env node
/**
 * decrypt_default_store_pass.js
 *
 * Re-implements hvigor's DecipherUtil.decryptPwd() so that we can read the
 * password that DevEco keeps in its own encrypted resource blob
 * (hvigor-ohos-plugin/res/material/zb/de).
 *
 * Why we need it
 * --------------
 * Since hvigor 5.x, `signingConfigs[].material.storePassword` in
 * build-profile.json5 is NOT a plain password -- it is an AES-128-GCM
 * encrypted blob in hex, and the encryption key is derived from a "material"
 * directory that lives next to the keystore file:
 *
 *     <dir containing the .p12>/material/{fd,ac,ce}
 *
 * The password must therefore be at least 32 hex chars long, which is exactly
 * what the "The length of the storePassword or keyPassword field in the
 * signature configuration is less than 32" error is about.
 *
 * Usage:
 *   node decrypt_default_store_pass.js [hvigor-ohos-plugin-dir]
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
  const entries = fs.readdirSync(dir);
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

/** Exactly DecipherUtil.xorComponents() */
function xorComponents(list) {
  let acc = xor(list[0], list[1]);
  for (let i = 2; i < list.length; i++) acc = xor(acc, list[i]);
  return Buffer.from(acc);
}

/** Exactly DecipherUtil.getRootKey() */
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

/** Exactly DecipherUtil.getKey() */
function getKey(baseDir) {
  // DecipherUtil.getKey(t) works on path.resolve(t, "material")
  const materialDir = path.resolve(baseDir, 'material');
  const fdRoot = path.resolve(materialDir, DIRS[0]);
  const fdSub = fs.readdirSync(fdRoot).filter((d) => d !== '.DS_Store');
  const fdParts = fdSub.map((d) => readDirBytes(path.join(fdRoot, d)));
  const salt = readDirBytes(path.resolve(materialDir, DIRS[1]));
  const rootKey = getRootKey(fdParts, salt);
  const work = readDirBytes(path.resolve(materialDir, DIRS[2]));
  return new Int8Array(decrypt(rootKey, work));
}

function decryptPwd(materialDir, hexPassword) {
  const key = getKey(materialDir);
  return decrypt(key, new Int8Array(Buffer.from(hexPassword, 'hex'))).toString('utf-8');
}

module.exports = { decryptPwd, getKey, decrypt, COMPONENT };

if (require.main === module) {
  const pluginDir =
    process.argv[2] ||
    process.env.DEVECO_TOOLS ||
      path.join(__dirname, '..', '..', '..', 'deveco-tools', 'command-line-tools') +
      '/hvigor/hvigor-ohos-plugin';
  const res = path.resolve(pluginDir, 'res');
  const blob = fs.readFileSync(path.join(res, 'material', 'zb', 'de')).toString().trim();
  const plain = decryptPwd(res, blob);
  console.log('resource dir      :', res);
  console.log('encrypted blob len:', blob.length);
  console.log('DEFAULT_STORE_PASS:', JSON.stringify(plain));
  console.log('plain length      :', plain.length);
}
