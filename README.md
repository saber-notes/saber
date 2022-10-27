# <img src="https://github.com/adil192/saber/raw/main/assets/icon/icon.png" width="30" height="30" alt="Logo"> Saber

A (work-in-progress) cross-platform libre notes app. Please note that this app is still in early stages and not ready to trust with your notes yet.

|         | Android | iOS  | Linux | macOS | Windows | Web  |
| ------- | ------- | ---- | ----- | ----- | ------- | ---- |
| Support | ✓       | ✓    | ✓     | ✓     | ✓       | ✓    |

Android and Linux are the main platforms that are being developed for,
but if you encounter any bugs on other platforms, please open an [issue][issues].

<details open>
<summary>Tap to show/hide screenshots</summary>

<div>
<img src="https://github.com/adil192/saber/raw/main/metadata/en-US/images/tenInchScreenshots/home-desktop.png" width="400">
<img src="https://github.com/adil192/saber/raw/main/metadata/en-US/images/tenInchScreenshots/editor-desktop.png" width="400">
<img src="https://github.com/adil192/saber/raw/main/metadata/en-US/images/tenInchScreenshots/login-desktop.png" width="400">
</div>
</details>

## Features

Please see [#1 Saber progress][progress].

## Install

Saber is still in early stages but if you'd like to check it out,
you can see the online PWA at [saber.adil.hanney.org][saber_web].
Alternatively, install it natively...

<details open>
<summary>Tap to show/hide install instructions</summary>

#### Android

Option 1 (recommended): Download and install `app-release.apk` from the latest [Release][releases].

Option 2: Download from [F-Droid][f-droid]

Option 3: Download from the [Play Store][google_play]

#### Linux

Option 1 (recommended): Install the flatpak from Flathub: `flatpak --user install com.adilhanney.saber`.

Option 2: Download `Saber.flatpak` from the latest [Release][releases] and install with `flatpak --user install Saber.flatpak`

#### Windows

Download and install `SaberInstaller.exe` from the latest [Release][releases]

#### iOS

See [#4 How to install on iOS](https://github.com/adil192/saber/discussions/4)

#### macOS

Download `Saber.app.zip` from the latest [Release][releases]
and move the `Saber` app to `/Applications`.
macOS will warn you that the app is from an unidentified developer when you first open it, so
you'll need to go to `System Preferences > Security & Privacy` and click `Open Anyway`.

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

This is good enough for using on your own computer, but if you want to redistribute your build,
you need to use a predictable environment: fork this repo and use the GitHub Action
[Build Flatpak](https://github.com/adil192/saber/actions/workflows/flatpak.yml) instead.

#### Android

`flutter build apk`

You may need to generate a signing certificate and create the `android/key.properties` file.
More information on https://docs.flutter.dev/deployment/android#create-an-upload-keystore

Note: F-Droid releases are built slightly differently:
`flutter build apk --flavor fdroid  -t lib/main_fdroid.dart`

#### The web

`flutter build web`

#### Windows

`flutter build windows`

The Windows installer is created with [Inno Setup](https://jrsoftware.org/isinfo.php).
To create an installer of your own, run the above build command, then edit and run
[installers/desktop_inno_script.iss](https://github.com/adil192/saber/blob/main/installers/desktop_inno_script.iss)
with Inno Setup Compiler.

#### iOS and macOS

If you have a macOS computer, you can
[build for iOS](https://docs.flutter.dev/deployment/ios#create-an-app-bundle)
with `flutter build ipa` or
[build for macOS](https://docs.flutter.dev/deployment/macos#create-a-build-archive-with-xcode)
with `flutter build macos`.

If you don't, fork this repo and use the GitHub Action
[Build for macOS and iOS](https://github.com/adil192/saber/actions/workflows/apple.yml).
Alternatively, follow this YouTube tutorial
[How to compile a flutter application to iPhone with no mac (free | no jailbreak)](https://www.youtube.com/watch?v=m3_6z2wfHiY)
to manually build with [Codemagic](https://codemagic.io/start/).

</details>

## Links

- [Nextcloud server][nextcloud]
- [Privacy policy][privacy]
- [License][license]
- [Releases][releases]

## Translating

1. Fork this repo
2. Look for your locale code [here](https://saimana.com/list-of-country-locale-code/),
   e.g. `es` for Spanish, `fr` for French, `hi` for Hindi, etc.
3. Copy `lib/i18n/strings.i18n.json` to `lib/i18n/strings_XX.i18n.json` (replacing `XX` with your locale code)
4. Translate the strings in `lib/i18n/strings_XX.i18n.json`
5. Open a pull request!

Also see [`slang`'s Getting Started](https://pub.dev/packages/slang#getting-started) for more information.

## Development notes

<details>
<summary>Show/hide development notes</summary>

- When updating the **app version**, you'll need to make changes to the following files:
  - `pubspec.yaml`: `version`
  - `lib/data/version.dart`: `buildNumber`
  - `windows/runner/Runner.rc`: `VERSION_AS_NUMBER` and `VERSION_AS_STRING`
  - `installers/desktop_inno_script.iss`: `MyAppVersion`
  - `flatpak/com.adilhanney.saber.metainfo.xml`: `<releases>`
  - `metadata/en-US/changelogs/`: Create a changelog for the new version
- When updating the **icons**, run the following commands:
  - General: `flutter pub run icons_launcher:create`
  - Flatpak icons: `cd assets/icon && ./resize-icon.sh`
- When updating the **translations**...
  - Run the following command `flutter pub run slang`
  - If you're adding a new language, edit `CFBundleLocalizations` in `ios/Runner/Info.plist`
    and `android:supportsRtl` in `android/app/src/main/AndroidManifest.xml`

</details>

[saber_web]: https://saber.adil.hanney.org
[f-droid]: https://f-droid.org/packages/com.adilhanney.saber/
[google_play]: https://play.google.com/store/apps/details?id=com.adilhanney.saber

[nextcloud]: https://nc.saber.adil.hanney.org/

[privacy]: https://github.com/adil192/saber/blob/main/privacy_policy.md
[license]: https://github.com/adil192/saber/blob/main/LICENSE.md

[releases]: https://github.com/adil192/saber/releases
[issues]: https://github.com/adil192/saber/issues
[progress]: https://github.com/adil192/saber/discussions/1
