# onyxsdk_pen

This plugin integrates the
[Onyx Pen SDK](https://github.com/onyx-intl/OnyxAndroidDemo/blob/master/doc/Onyx-Pen-SDK.md)
into Flutter to improve e-ink performance in drawing apps.

Most of the SDK functionality is omitted due to it being restricted to Onyx devices.
We instead only provide the `OnyxSdkPenArea` widget. The children of this widget
(typically including a `CustomPaint` and `GestureDetector`)
will automatically gain fluid pen strokes.

You are responsible for taking user input and drawing it. The
`OnyxSdkPenArea` widget will just make things faster on Onyx devices.

When used on devices that aren't Onyx Android devices, the `OnyxSdkPenArea` widget will
just return its child.

## Getting Started

### Android

Incorporate the following snippets into your app...

#### `android/app/build.gradle.kts`

```gradle
android {
    packaging {
        jniLibs.pickFirsts.add("lib/*/libc++_shared.so")
    }
}
```

#### `android/app/src/main/AndroidManifest.xml`

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools">

    <!-- Add this `tools:replace` attribute to the `application` tag -->
    <application
        android:label="my wonderful app"
        tools:replace="android:label">
```

If you need multiple entries in tools:replace, separate them with commas, e.g.
`tools:replace="android:label,android:allowBackup"`.

#### `android/build.gradle.kts`

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()
        // Add these two repos:
        maven("https://jitpack.io")
        maven("http://repo.boox.com/repository/maven-public/") {
            isAllowInsecureProtocol = true
        }
    }
}
```

#### `pubspec.yaml`

```yaml
dependencies:
  onyxsdk_pen: ^1.4.0
```

#### `lib/main.dart`

```dart
// Wrap your drawable widget with the OnyxSdkPenArea widget, e.g.
OnyxSdkPenArea(
  // Optional parameters:
  strokeStyle: OnyxStrokeStyle.fountainPen,
  strokeColor: Colors.black,
  strokeWidth: 3.0,

  child: GestureDetector(
    onPanUpdate: (details) {},
    child: CustomPaint(
      painter: MyPainter(points),
    ),
  ),
),
```

Run `await OnyxSdkPenArea.init()` in the `main` function of your app.
This is not required, but it will improve initial performance on
non-Onyx Android devices.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnyxSdkPenArea.init();
  runApp(MyApp());
}
```

## Help wanted

I no longer have an Onyx device,
so this plugin is developed in a "best effort" manner.
Community contributions are welcome!
