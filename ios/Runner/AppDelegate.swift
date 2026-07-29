// 🤖 Generated wholely or partially with Claude Code (Claude Fable 5)

import Flutter
import UIKit
import workmanager_apple

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private let pencilInteractions = PencilInteractionHandler()

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
    pencilInteractions.setUp(messenger: engineBridge.applicationRegistrar.messenger())
  }
}

/// Forwards Apple Pencil double-taps to Dart over a method channel,
/// received by `ApplePencilInteractions` in lib/data/apple_pencil_interactions.dart.
class PencilInteractionHandler: NSObject, UIPencilInteractionDelegate {
  private var channel: FlutterMethodChannel?
  private var interactionAttached = false

  override init() {
    super.init()
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(attachInteraction),
      name: UIScene.didActivateNotification,
      object: nil
    )
  }

  func setUp(messenger: FlutterBinaryMessenger) {
    channel = FlutterMethodChannel(
      name: "com.adilhanney.saber/apple_pencil",
      binaryMessenger: messenger
    )
  }

  /// Attaches a UIPencilInteraction to the scene's window once the scene
  /// becomes active. The window may not exist before then.
  @objc private func attachInteraction(_ notification: Notification) {
    guard !interactionAttached else { return }
    guard let window = (notification.object as? UIWindowScene)?.windows.first else { return }

    let interaction = UIPencilInteraction()
    interaction.delegate = self
    window.addInteraction(interaction)
    interactionAttached = true
  }

  // Called on iOS versions before 17.5
  func pencilInteractionDidTap(_ interaction: UIPencilInteraction) {
    sendDoubleTap()
  }

  @available(iOS 17.5, *)
  func pencilInteraction(
    _ interaction: UIPencilInteraction,
    didReceiveTap tap: UIPencilInteraction.Tap
  ) {
    sendDoubleTap()
  }

  /// Sends the double-tap to Dart along with the system-wide preferred tap
  /// action, so that Dart can honor the "Off" (.ignore) system setting.
  private func sendDoubleTap() {
    channel?.invokeMethod("doubleTap", arguments: preferredTapActionName)
  }

  private var preferredTapActionName: String {
    switch UIPencilInteraction.preferredTapAction {
    case .ignore: return "ignore"
    case .switchEraser: return "switchEraser"
    case .switchPrevious: return "switchPrevious"
    case .showColorPalette: return "showColorPalette"
    case .showInkAttributes: return "showInkAttributes"
    default: return "other"
    }
  }
}
