## 1.5.0

- Hack: Excluded the mmkv lib from onyxsdk_pen as suggested by Onyx. This should complete the 16KB page size support to meet Google Play requirements.
- Added support for Flutter 3.44 and migrated to the built-in Kotlin Gradle Plugin. This package now requires Flutter 3.44 or later.

## 1.4.0

- Updated the SDK to support [16 KB page sizes](https://github.com/onyx-intl/OnyxAndroidDemo/issues/132). This should resolve issues with Google Play submissions.
- Added proguard rules so you no longer need to add them to your app manually.
- Updated the README's setup instructions for the latest SDK, including `build.gradle.kts` snippets. No changes are needed for existing apps.

## 1.3.0

- `OnyxSdkPenArea` now supports setting stroke style, color, and width, thanks to zinstack625 in [#1452](https://github.com/saber-notes/saber/pull/1452):
  ```dart
  OnyxSdkPenArea(
    // Choose between pen, pencil, marker, and more
    strokeStyle: OnyxStrokeStyle.fountainPen,
    // Set the stroke color
    strokeColor: Colors.black,
    // Set the stroke width
    strokeWidth: 3.0,
    child: CustomPaint(...),
  ),
  ```
- Fixed the display's drawing mode not resetting when minimizing/restoring the app, plus general improvements, thanks to zinstack625 in [#1452](https://github.com/saber-notes/saber/pull/1452).
- Added the package status section to the README.

## 1.2.5

- Update the hidden API bypass to hopefully prevent Google Play rejections (https://github.com/saber-notes/saber/issues/1514)

## 1.2.4

- Fix Note Air 3 - Add Hidden API Bypass for SDK30+ and init RxManager (https://github.com/saber-notes/saber/pull/1378)

## 1.2.3

- Reverted the SDK update from v1.2.1 to hopefully make this package work again

## 1.2.2

- Improved pub.dev scores

## 1.2.1

- Updated the Onyx SDK

## 1.2.0

- Added an optional `init` method to improve initial performance on non-Onyx Android devices. See the README for more information.

## 1.1.1

- Add pub.dev topics

## 1.1.0

- Update to Flutter 3.13.0
- Update the Onyx SDK

## 1.0.3

* Update pub.dev description

## 1.0.2

* Refresh the screen after 1s (default). This fixes the issue where after writing with
  the pen, the screen wouldn't respond to your finger.

## 1.0.1

* Initially refresh the screen (plugin now works)

## 1.0.0

* Initial release
