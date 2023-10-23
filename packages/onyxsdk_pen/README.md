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

See [this commit](https://github.com/saber-notes/saber/commit/ff925089969b6fb97385fa40cea6e0dad3b7c6be)
for an example of the following setup...

#### `android/app/build.gradle`

```gradle
android {
    defaultConfig {
        // Onyx SDK requires 23 or higher
        minSdkVersion 23
    }

    packagingOptions {
        pickFirst 'lib/*/libc++_shared.so'
        pickFirst 'androidsupportmultidexversion.txt'
    }
}
```

#### `android/app/src/main/AndroidManifest.xml`

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools"
    package="com.adilhanney.saber">

    <!-- Add this `tools:replace` attribute to the `application` tag -->
    <application
        tools:replace="android:label">

    </application>
</manifest>
```

In my case, I got a compiler error saying that I needed `tools:replace="android:allowBackup"`
so I merged the two with `tools:replace="android:label,android:allowBackup"`.

#### `android/build.gradle`

```gradle
allprojects {
    repositories {
        google()
        mavenCentral()

        // Add these two lines
        maven {
            url "https://jitpack.io"
        }
        maven {
            url "http://repo.boox.com/repository/maven-public/"
            allowInsecureProtocol true
        }
    }
}
```

#### `pubspec.yaml`

```yaml
dependencies:
  onyxsdk_pen: ^1.0.3
```

#### `lib/main.dart`

```dart
// Wrap your drawable widget with the OnyxSdkPenArea widget, e.g.
OnyxSdkPenArea(
  child: GestureDetector(
    onPanUpdate: (details) {},
    child: CustomPaint(
      painter: MyPainter(points),
    ),
  ),
),
```

You can optionally run the `init` method in the `main` function of your app to
initialize the Onyx SDK. This is not required, but it will improve initial
performance on non-Onyx Android devices.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnyxSdkPenArea.init();
  runApp(MyApp());
}
```

## Help wanted

I no longer have an Onyx device, so I can't really develop this plugin any further.
If you are able to, we're looking for help with this feature:
https://github.com/saber-notes/saber/issues/848
