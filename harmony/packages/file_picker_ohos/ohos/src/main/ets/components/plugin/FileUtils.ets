/*
 * OpenHarmony (HarmonyOS NEXT) 版 file_picker 的文件工具类。
 *
 * 核心职责:把系统选择器返回的 `file://` URI 复制进应用沙箱,
 * 让 Dart 侧拿到一个真实、可读写的文件系统路径。
 */

import { common } from '@kit.AbilityKit';
import { fileIo as fs } from '@kit.CoreFileKit';

/**
 * 文件读写与沙箱缓存相关的工具方法。
 */
export class FileUtils {
  static readonly TAG: string = 'FilePickerUtils';

  /** 沙箱缓存子目录名。 */
  static readonly CACHE_DIR_NAME: string = 'file_picker';

  /**
   * 拿到沙箱内的缓存目录,不存在则创建。
   */
  static cacheDir(context: common.UIAbilityContext): string {
    const dir: string = `${context.cacheDir}/${FileUtils.CACHE_DIR_NAME}`;
    if (!FileUtils.exists(dir)) {
      fs.mkdirSync(dir, true);
    }
    return dir;
  }

  /**
   * 判断路径是否存在。`accessSync` 在路径非法时会抛异常,这里统一吞掉。
   */
  static exists(path: string): boolean {
    try {
      return fs.accessSync(path);
    } catch (e) {
      return false;
    }
  }

  /**
   * 从 URI 里取出文件名(去掉查询串)。
   *
   * 系统选择器给的 URI 里的中文是**百分号编码**的
   * (例如 `file://.../%E6%B5%8B%E8%AF%95.sba`),这里解码回原文,
   * 否则 Dart 侧拿到的文件名会是一串 `%E6%B5%8B...`。
   */
  static nameOf(uri: string): string {
    let name: string = uri;
    const query: number = name.indexOf('?');
    if (query >= 0) {
      name = name.substring(0, query);
    }
    const slash: number = name.lastIndexOf('/');
    if (slash >= 0) {
      name = name.substring(slash + 1);
    }
    if (name.length === 0) {
      name = 'file';
    }
    // 百分号解码。文件名里本来就带 '%' 时会解码失败,那就用原名。
    try {
      const decoded: string = decodeURIComponent(name);
      if (decoded.length > 0) {
        name = decoded;
      }
    } catch (e) {
      // 保持原样
    }
    return name;
  }

  /**
   * 把系统选择器返回的 URI 复制到应用沙箱缓存目录。
   *
   * 返回沙箱内的真实路径 —— Dart 的 `File` / `Directory` 只能直接操作真实路径,
   * 系统选择器给的 `file://media/...` 之类 URI 用不了。
   */
  static copyToSandbox(context: common.UIAbilityContext, uri: string): string {
    const dir: string = FileUtils.cacheDir(context);
    const dest: string = `${dir}/${FileUtils.nameOf(uri)}`;
    if (FileUtils.exists(dest)) {
      fs.unlinkSync(dest);
    }
    const src = fs.openSync(uri, fs.OpenMode.READ_ONLY);
    try {
      const out = fs.openSync(
        dest,
        fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC,
      );
      try {
        fs.copyFileSync(src.fd, out.fd);
      } finally {
        fs.closeSync(out);
      }
    } finally {
      fs.closeSync(src);
    }
    return dest;
  }

  /**
   * 把 URI 解析成沙箱内的真实路径 —— 用于「选择文件夹」。
   */
  static resolvePath(uri: string): string {
    const file = fs.openSync(uri, fs.OpenMode.READ_ONLY);
    try {
      return file.path;
    } finally {
      fs.closeSync(file);
    }
  }

  /**
   * 读取整个文件内容。
   */
  static readBytes(path: string): Uint8Array {
    const file = fs.openSync(path, fs.OpenMode.READ_ONLY);
    try {
      const stat = fs.statSync(file.fd);
      const buffer = new ArrayBuffer(stat.size);
      let offset: number = 0;
      while (offset < stat.size) {
        // ReadOptions 只有 offset / length,没有 position ——
        // 要从指定位置读得先 lseekSync。这里从当前读指针往后读即可。
        const read: number = fs.readSync(file.fd, buffer, {
          offset: offset,
          length: stat.size - offset,
        });
        if (read <= 0) {
          break;
        }
        offset += read;
      }
      return new Uint8Array(buffer, 0, offset);
    } finally {
      fs.closeSync(file);
    }
  }

  /**
   * 把字节写入沙箱内的文件。
   */
  static writeBytes(path: string, bytes: Uint8Array): void {
    if (FileUtils.exists(path)) {
      fs.unlinkSync(path);
    }
    const file = fs.openSync(
      path,
      fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC,
    );
    try {
      fs.writeSync(file.fd, bytes.buffer);
    } finally {
      fs.closeSync(file);
    }
  }

  /**
   * 清空缓存目录。
   */
  static clearCache(context: common.UIAbilityContext): boolean {
    const dir: string = `${context.cacheDir}/${FileUtils.CACHE_DIR_NAME}`;
    if (!FileUtils.exists(dir)) {
      return true;
    }
    try {
      const names: string[] = fs.listFileSync(dir);
      for (const name of names) {
        const path: string = `${dir}/${name}`;
        try {
          fs.unlinkSync(path);
        } catch (e) {
          // 子目录之类删不掉,跳过即可。
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
