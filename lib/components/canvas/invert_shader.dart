import 'dart:ui';

abstract class InvertShader {
  static late final FragmentProgram _program;

  static Future<void> init() async {
    _program = await FragmentProgram.fromAsset('shaders/invert.frag');
  }

  static FragmentShader create() {
    return _program.fragmentShader();
  }
}
