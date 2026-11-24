/*
 * OpenHarmony (HarmonyOS NEXT) 版 file_picker 的原生实现。
 *
 * 用系统原生的 DocumentViewPicker / PhotoViewPicker / AudioViewPicker
 * 选文件、选目录、存文件,并把结果复制进应用沙箱后返回给 Dart 侧。
 */

import { common, UIAbility } from '@kit.AbilityKit';
import { picker, fileIo as fs } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Log, MethodResult } from '@ohos/flutter_ohos';

import { FileUtils } from './FileUtils';

/** 原生侧返回给 Dart 的单个文件。 */
export interface PickedFile {
  /** 应用沙箱内的真实路径。 */
  path: string;
  /** 文件名(带扩展名)。 */
  name: string;
  /** 文件大小,字节。 */
  size: number;
  /** 文件内容;按需携带。 */
  bytes?: Uint8Array;
}

/**
 * 文件选择器的主体逻辑。
 */
export class FilePickerDelegate {
  private static readonly TAG: string = 'FilePickerDelegate';

  private context: common.UIAbilityContext | null = null;
  private pendingResult: MethodResult | null = null;
  private allowMultiple: boolean = false;
  private allowedExtensions: string[] = [];
  private withData: boolean = false;

  constructor(ability: UIAbility) {
    this.context = ability.context as common.UIAbilityContext;
  }

  /**
   * 弹出系统选择器并返回选中的文件。
   *
   * @param type 文件类型:`any` / `image` / `video` / `audio` / `custom`。
   * @param allowMultiple 是否允许多选。
   * @param withData 是否把文件内容一并带回来。
   * @param allowedExtensions 允许的扩展名(带点),仅 `custom` 有效。
   * @param result 方法调用的回执。
   */
  async pickFiles(type: string, allowMultiple: boolean, withData: boolean,
    allowedExtensions: string[], result: MethodResult): Promise<void> {
    this.pendingResult = result;
    this.allowMultiple = allowMultiple;
    this.withData = withData;
    this.allowedExtensions = allowedExtensions;

    try {
      const uris: string[] = await this.launch(type);
      if (uris === null || uris.length === 0) {
        // 用户取消。
        this.finishWithFiles([]);
        return;
      }
      const files: PickedFile[] = [];
      for (const uri of uris) {
        try {
          files.push(this.materialise(uri));
        } catch (error) {
          const e = error as BusinessError;
          Log.e(FilePickerDelegate.TAG, `failed to copy ${uri}: ${e.message}`);
        }
      }
      Log.i(FilePickerDelegate.TAG, `picked ${files.length} file(s)`);
      this.finishWithFiles(files);
    } catch (error) {
      const e = error as BusinessError;
      Log.e(FilePickerDelegate.TAG, `picker failed: ${e.message}`);
      this.finishWithError(`${e.code}`, e.message ?? 'file picker failed');
    }
  }

  /**
   * 弹出目录选择器,返回选中目录的沙箱内真实路径。
   */
  async pickDirectory(result: MethodResult): Promise<void> {
    this.pendingResult = result;
    try {
      const context = this.context as common.UIAbilityContext;
      const options = new picker.DocumentSelectOptions();
      options.selectMode = picker.DocumentSelectMode.FOLDER;
      options.maxSelectNumber = 1;
      const uris: string[] = await new picker.DocumentViewPicker(context).select(options);
      if (uris === null || uris.length === 0) {
        this.finishWithString('');
        return;
      }
      this.finishWithString(FileUtils.resolvePath(uris[0]));
    } catch (error) {
      const e = error as BusinessError;
      Log.e(FilePickerDelegate.TAG, `folder picker failed: ${e.message}`);
      this.finishWithError(`${e.code}`, e.message ?? 'folder picker failed');
    }
  }

  /**
   * 让用户在系统 UI 里选一个保存位置,把 [bytes] 写进去。
   *
   * @param fileName 建议的文件名(带扩展名)。
   * @param bytes 文件内容。
   * @param initialDirectory 建议的初始目录。
   * @param result 方法调用的回执。
   */
  async saveFile(fileName: string, bytes: Uint8Array, initialDirectory: string | undefined,
    result: MethodResult): Promise<void> {
    this.pendingResult = result;
    try {
      const context = this.context as common.UIAbilityContext;
      // 先落到沙箱缓存里,等用户选好位置再拷过去。
      const staged: string = `${FileUtils.cacheDir(context)}/${fileName}`;
      FileUtils.writeBytes(staged, bytes);

      const options = new picker.DocumentSaveOptions();
      options.newFileNames = [fileName];
      if (initialDirectory !== undefined && initialDirectory.length > 0) {
        options.defaultFilePathUri = initialDirectory;
      }
      const uris: string[] = await new picker.DocumentViewPicker(context).save(options);
      if (uris === null || uris.length === 0) {
        this.finishWithString('');
        return;
      }
      const target: string = uris[0];
      this.copyInto(target, staged);
      this.finishWithString(target);
    } catch (error) {
      const e = error as BusinessError;
      Log.e(FilePickerDelegate.TAG, `save failed: ${e.message}`);
      this.finishWithError(`${e.code}`, e.message ?? 'save failed');
    }
  }

  /**
   * 把沙箱里的文件拷到系统给出的目标位置。
   */
  private copyInto(target: string, source: string): void {
    try {
      fs.copyFileSync(source, target);
      return;
    } catch (error) {
      // 目标可能是 `file://docs/...` 形式的 URI,直接拷不行时改用 fd。
      Log.w(FilePickerDelegate.TAG, `direct copy failed, retrying with fds: ${error}`);
    }
    const src = fs.openSync(source, fs.OpenMode.READ_ONLY);
    try {
      const dst = fs.openSync(
        target,
        fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE | fs.OpenMode.TRUNC,
      );
      try {
        fs.copyFileSync(src.fd, dst.fd);
      } finally {
        fs.closeSync(dst);
      }
    } finally {
      fs.closeSync(src);
    }
  }

  /**
   * 根据文件类型拉起对应的系统选择器,返回选中的 URI 列表。
   */
  private async launch(type: string): Promise<string[]> {
    const context = this.context as common.UIAbilityContext;
    switch (type) {
      case 'image': {
        const options = new picker.PhotoSelectOptions();
        options.MIMEType = picker.PhotoViewMIMETypes.IMAGE_TYPE;
        options.maxSelectNumber = this.allowMultiple ? 9 : 1;
        const result = await new picker.PhotoViewPicker(context).select(options);
        return result.photoUris;
      }
      case 'video': {
        const options = new picker.PhotoSelectOptions();
        options.MIMEType = picker.PhotoViewMIMETypes.VIDEO_TYPE;
        options.maxSelectNumber = this.allowMultiple ? 9 : 1;
        const result = await new picker.PhotoViewPicker(context).select(options);
        return result.photoUris;
      }
      case 'audio': {
        const options = new picker.AudioSelectOptions();
        options.maxSelectNumber = this.allowMultiple ? 9 : 1;
        return await new picker.AudioViewPicker(context).select(options);
      }
      default: {
        // 系统对 fileSuffixFilters 有格式和数量上的限制(后缀要带点、数量有上限),
        // 一旦不满足 select() 会直接抛错、选择器根本弹不出来。
        // 这里按「带点后缀 → 不带点后缀 → 完全不过滤」的顺序逐个尝试,
        // 保证最差情况下也能弹出选择器,只是不按后缀过滤。
        const maxSelectNumber: number = this.allowMultiple ? 9 : 1;
        const attempts: picker.DocumentSelectOptions[] = [];

        if (type === 'custom' && this.allowedExtensions.length > 0) {
          const withDot: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
          withDot.maxSelectNumber = maxSelectNumber;
          withDot.fileSuffixFilters = this.allowedExtensions;
          attempts.push(withDot);

          const withoutDot: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
          withoutDot.maxSelectNumber = maxSelectNumber;
          withoutDot.fileSuffixFilters = this.allowedExtensions.map((extension: string): string => {
            return extension.startsWith('.') ? extension.substring(1) : extension;
          });
          attempts.push(withoutDot);
        }

        const plain: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
        plain.maxSelectNumber = maxSelectNumber;
        attempts.push(plain);

        let lastCode: string = '';
        let lastMessage: string = '';
        for (const options of attempts) {
          try {
            return await new picker.DocumentViewPicker(context).select(options);
          } catch (error) {
            const e = error as BusinessError;
            lastCode = `${e.code}`;
            lastMessage = e.message ?? 'file picker failed';
            Log.w(
              FilePickerDelegate.TAG,
              `select with filters failed: ${lastMessage}`,
            );
          }
        }
        throw new Error(`file picker failed: ${lastCode} ${lastMessage}`);
      }
    }
  }

  /**
   * 把选中的 URI 复制进沙箱,构造返回给 Dart 的文件描述。
   */
  private materialise(uri: string): PickedFile {
    const context = this.context as common.UIAbilityContext;
    const path: string = FileUtils.copyToSandbox(context, uri);
    const stat = fs.statSync(path);
    const file: PickedFile = {
      path: path,
      name: FileUtils.nameOf(uri),
      size: stat.size,
    };
    if (this.withData) {
      file.bytes = FileUtils.readBytes(path);
    }
    return file;
  }

  private finishWithFiles(files: PickedFile[]): void {
    const result: MethodResult | null = this.pendingResult;
    this.pendingResult = null;
    if (result === null) {
      return;
    }
    const maps: Map<string, Object>[] = [];
    for (const file of files) {
      const map: Map<string, Object> = new Map();
      map.set('path', file.path);
      map.set('name', file.name);
      map.set('size', file.size);
      if (file.bytes !== undefined) {
        map.set('bytes', file.bytes);
      }
      maps.push(map);
    }
    result.success(maps);
  }

  private finishWithString(value: string): void {
    const result: MethodResult | null = this.pendingResult;
    this.pendingResult = null;
    result?.success(value);
  }

  private finishWithError(code: string, message: string): void {
    const result: MethodResult | null = this.pendingResult;
    this.pendingResult = null;
    result?.error(code, message, null);
  }
}
