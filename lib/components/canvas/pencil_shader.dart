import 'dart:ui';

abstract class PencilShader {
  static late final FragmentProgram _program;

  static Future<void> init() async {
    _program = await FragmentProgram.fromAsset('shaders/pencil.frag');
  }

  static FragmentShader create() {
    return _program.fragmentShader();
  }
}
