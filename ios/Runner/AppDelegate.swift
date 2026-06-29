import Flutter
import UIKit
import workmanager_apple

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, UIPencilInteractionDelegate {
  private var pencilGestureChannel: FlutterMethodChannel?
  private var pencilInteraction: UIPencilInteraction?

  /// Registers all pubspec-referenced Flutter plugins in the given registry
  static func registerPlugins(with registry: FlutterPluginRegistry) {
    GeneratedPluginRegistrant.register(with: registry)
  }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    WorkmanagerPlugin.setPluginRegistrantCallback { registry in
      // The following code will be called upon WorkmanagerPlugin's registration.
      AppDelegate.registerPlugins(with: registry)
    }

    // At least 12 hours between background fetches
    UIApplication.shared.setMinimumBackgroundFetchInterval(TimeInterval(12 * 60 * 60))

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    AppDelegate.registerPlugins(with: engineBridge.pluginRegistry)
    registerPencilGestures(with: engineBridge)
  }

  private func registerPencilGestures(with engineBridge: FlutterImplicitEngineBridge) {
    guard UIDevice.current.userInterfaceIdiom == .pad else {
      return
    }

    let registrar = engineBridge.pluginRegistry.registrar(
      forPlugin: "SaberApplePencilGestures"
    )
    pencilGestureChannel = FlutterMethodChannel(
      name: "com.saber.apple_pencil_gestures",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    registerPencilInteraction(with: registrar)
  }

  private func registerPencilInteraction(
    with registrar: FlutterPluginRegistrar?,
    attemptsRemaining: Int = 8
  ) {
    guard pencilInteraction == nil else {
      return
    }

    guard let view = registrar?.viewController?.view else {
      guard attemptsRemaining > 0 else {
        NSLog("Saber Apple Pencil gestures: Flutter view unavailable")
        return
      }

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
        self?.registerPencilInteraction(
          with: registrar,
          attemptsRemaining: attemptsRemaining - 1
        )
      }
      return
    }

    let interaction = UIPencilInteraction()
    interaction.delegate = self
    view.addInteraction(interaction)
    pencilInteraction = interaction
    NSLog("Saber Apple Pencil gestures: registered")
  }

  func pencilInteractionDidTap(_ interaction: UIPencilInteraction) {
    sendPencilDoubleTap()
  }

  @available(iOS 17.5, *)
  func pencilInteraction(
    _ interaction: UIPencilInteraction,
    didReceiveSqueeze squeeze: UIPencilInteraction.Squeeze
  ) {
    guard squeeze.phase == .began else {
      return
    }

    pencilGestureChannel?.invokeMethod("applePencilSqueeze", arguments: nil)
  }

  private func sendPencilDoubleTap() {
    pencilGestureChannel?.invokeMethod("applePencilDoubleTap", arguments: nil)
  }
}
