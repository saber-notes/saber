/// Represents the hardware characteristics of the currently connected writing instrument.
class StylusCapabilities {
  final bool supportsPressure;
  final bool supportsTilt;
  final bool supportsBarrelRoll;
  final bool supportsSqueeze;
  final bool supportsHover;

  const StylusCapabilities({
    required this.supportsPressure,
    required this.supportsTilt,
    required this.supportsBarrelRoll,
    required this.supportsSqueeze,
    required this.supportsHover,
  });

  static const StylusCapabilities unknown = StylusCapabilities(
    supportsPressure: false,
    supportsTilt: false,
    supportsBarrelRoll: false,
    supportsSqueeze: false,
    supportsHover: false,
  );
}
