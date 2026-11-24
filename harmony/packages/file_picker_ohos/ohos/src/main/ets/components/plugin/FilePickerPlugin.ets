/*
 * OpenHarmony (HarmonyOS NEXT) 版 file_picker 的插件入口。
 *
 * method channel 的名字和参数刻意与 file_picker 上游其它平台保持一致,
 * 这样 Dart 侧不需要任何改动。
 */

import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
  AbilityPluginBinding,
  BinaryMessenger,
} from '@ohos/flutter_ohos';
import { common, UIAbility } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

import { FilePickerDelegate } from './FilePickerDelegate';
import { FileUtils } from './FileUtils';
import { Log } from '@ohos/flutter_ohos';

/** 与上游 file_picker 一致的 method channel 名。 */
const CHANNEL: string = 'miguelruivo.flutter.plugins.filepicker';
const TAG: string = 'FilePickerPlugin';

export default class FilePickerPlugin implements FlutterPlugin, MethodCallHandler {
  private channel: MethodChannel | null = null;
  private abilityBinding: AbilityPluginBinding | null = null;
  private pluginBinding: FlutterPluginBinding | null = null;
  private ability: UIAbility | null = null;
  private delegate: FilePickerDelegate | null = null;

  getUniqueClassName(): string {
    return 'FilePickerPlugin';
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.abilityBinding = null;
    this.pluginBinding = binding;
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    this.pluginBinding = null;
  }

  onAttachedToAbility(binding: AbilityPluginBinding): void {
    this.abilityBinding = binding;
    this.setup(
      this.pluginBinding?.getBinaryMessenger() as BinaryMessenger,
      binding.getAbility(),
      binding,
    );
  }

  onDetachedFromAbility(binding: AbilityPluginBinding): void {
    this.abilityBinding = null;
    this.ability = null;
    this.delegate = null;
    this.channel = null;
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    const ability: UIAbility | null = this.ability;
    if (ability === null) {
      result.error('no_activity', 'file picker plugin requires a foreground ability', null);
      return;
    }
    const args: Map<string, Object> = call.args;

    // 清掉上次遗留在缓存里的临时文件。
    if (call.method === 'clear') {
      try {
        result.success(FileUtils.clearCache(ability.context as common.UIAbilityContext));
      } catch (error) {
        const e = error as BusinessError;
        result.error(`${e.code}`, e.message, null);
      }
      return;
    }

    // 选择文件夹。
    if (call.method === 'dir') {
      this.delegate?.pickDirectory(result);
      return;
    }

    // 另存为。
    if (call.method === 'save') {
      const fileName: string = (args.get('fileName') as string) ?? 'file';
      const bytes: Uint8Array = args.get('bytes') as Uint8Array;
      const initialDirectory: string | undefined = args.get('initialDirectory') as string;
      if (bytes === undefined || bytes === null) {
        result.error('no_bytes', 'bytes are required to save a file', null);
        return;
      }
      this.delegate?.saveFile(fileName, bytes, initialDirectory, result);
      return;
    }

    // 其余的方法名就是文件类型:any / image / video / audio / custom。
    const type: string = call.method ?? 'any';
    const allowMultiple: boolean = (args.get('allowMultipleSelection') as boolean) ?? false;
    const withData: boolean = (args.get('withData') as boolean) ?? false;
    const allowedExtensions: string[] = this.normaliseExtensions(
      args.get('allowedExtensions') as string[],
    );
    Log.i(TAG, `pickFiles type=${type} multiple=${allowMultiple} withData=${withData} filters=[${allowedExtensions.join(',')}]`);
    this.delegate?.pickFiles(type, allowMultiple, withData, allowedExtensions, result);
  }

  /**
   * 把扩展名统一成带点的小写形式,原生侧的 fileSuffixFilters 需要这个格式。
   */
  private normaliseExtensions(extensions: string[] | undefined): string[] {
    if (extensions === undefined || extensions === null) {
      return [];
    }
    const result: string[] = [];
    for (const extension of extensions) {
      if (extension === undefined || extension === null || extension.length === 0) {
        continue;
      }
      result.push(extension.startsWith('.') ? extension.toLowerCase() : `.${extension.toLowerCase()}`);
    }
    return result;
  }

  setup(messenger: BinaryMessenger, ability: UIAbility, activityBinding: AbilityPluginBinding): void {
    this.ability = ability;
    this.delegate = new FilePickerDelegate(ability);
    this.channel = new MethodChannel(messenger, CHANNEL);
    this.channel.setMethodCallHandler(this);
  }
}
