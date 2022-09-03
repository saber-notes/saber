# <img src="https://github.com/adil192/saber/raw/main/assets/icon/icon.png" width="30" height="30" alt="Logo"> Saber

A (work-in-progress) cross-platform libre notes app. Please note that this app is still in early stages and not ready to trust with your notes yet.

|         | Android | iOS  | Linux | macOS | Web  | Windows |
| ------- | ------- | ---- | ----- | ----- | ---- | ------- |
| Support | ✓       | ✓*   | ✓     | ✗     | ✓    | ✓*      |

✓* Some platforms aren't tested regularly but bug reports are welcome.

<details open>
<summary>Tap to show/hide screenshots</summary>

<div>
<img src="https://github.com/adil192/saber/raw/main/assets/screenshots/home-desktop.png" width="400">
<img src="https://github.com/adil192/saber/raw/main/assets/screenshots/editor-desktop.png" width="400">
<img src="https://github.com/adil192/saber/raw/main/assets/screenshots/login-desktop.png" width="400">
</div>
</details>

## Features

Please see [#1 Saber progress](https://github.com/adil192/saber/discussions/1).

## Install

Saber is still in early stages but if you'd like to check it out,
you can see the online PWA at [saber.adil.hanney.org](https://saber.adil.hanney.org).
Alternatively, install it natively...

<details>
<summary>Tap to show/hide install instructions</summary>

#### Android

Option 1 (recommended): Download from the [Play Store](https://play.google.com/store/apps/details?id=com.adilhanney.saber) (not yet live)

Option 2: Download and install `app-release.apk` from the latest [Release](https://github.com/adil192/saber/releases)

#### Linux

Download `Saber.flatpak` from the latest [Release](https://github.com/adil192/saber/releases) and install with `flatpak --user install Saber.flatpak`

#### Windows

Download and install `SaberInstaller.exe` from the latest [Release](https://github.com/adil192/saber/releases)

#### iOS

See [#4 How to install on iOS](https://github.com/adil192/saber/discussions/4)

</details>

## Build from source

<details>
<summary>Tap to show/hide build instructions</summary>

### 1. Install flutter
https://docs.flutter.dev/get-started/install
### 2. Clone this project
```bash
git clone https://github.com/adil192/saber.git
```
### 3. Get dependencies
```bash
flutter pub get
```

### 4. Build for...

#### Linux

`flutter build linux`

This is good enough for using on your own computer, but if you want to redistribute your build, you need to use a predictable environment: fork this repo and use the GitHub Action [Build Flatpak](https://github.com/adil192/saber/actions/workflows/flatpak.yml) instead.

#### Android

`flutter build apk`

You may need to generate a signing certificate and create the `android/key.properties` file. More information on https://docs.flutter.dev/deployment/android#create-an-upload-keystore

#### The web

`flutter build web`

#### Windows

`flutter build windows`

The Windows installer is created with [Inno Setup](https://jrsoftware.org/isinfo.php). To create an installer of your own, run the above build command, then edit and run [installers/desktop_inno_script.iss](https://github.com/adil192/saber/blob/main/installers/desktop_inno_script.iss) with Inno Setup Compiler.

#### iOS

If you have a macOS computer, you can build for iOS with `flutter build ipa`
([more info](https://docs.flutter.dev/deployment/ios#create-an-app-bundle)).

If you don't, watch this YouTube tutorial
[How to compile a flutter application to iPhone with no mac (free | no jailbreak)](https://www.youtube.com/watch?v=m3_6z2wfHiY)
to build with [Codemagic](https://codemagic.io/start/) and install on your device.

</details>

## Links

- [Nextcloud server](https://nc.saber.adil.hanney.org/)
- [Privacy policy](https://github.com/adil192/saber/blob/main/privacy_policy.md)
- [License](https://github.com/adil192/saber/blob/main/LICENSE.md)
- [Releases](https://github.com/adil192/saber/releases)

## Development notes

- When updating the **app version**, you'll need to make changes to the following files:
  - `pubspec.yaml`: `version`
  - `lib/data/version.dart`: `buildNumber`
  - `windows/runner/Runner.rc`: `VERSION_AS_NUMBER` and `VERSION_AS_STRING`
  - `installers/desktop_inno_script.iss`: `MyAppVersion`
- When updating the **icons**, run the following commands:
  - General: `flutter pub run icons_launcher:create`
  - Flatpak icons: `cd assets/icon && ./resize-icon.sh`
