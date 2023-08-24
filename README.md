# <img src="https://github.com/adil192/saber/raw/main/assets/icon/icon.png" width="30" height="30" alt="Logo"> Saber

You can read this file in: [English](https://github.com/adil192/saber/blob/main/README.md), [češtině](https://github.com/adil192/saber/blob/main/README-cs.md), [繁體中文](https://github.com/adil192/saber/blob/main/README-zh-TW.md)

As the developer of Saber, I am thrilled to introduce you to an app that revolutionizes the way you take notes. Saber is the ultimate handwritten notetaking app designed to elevate your note-taking experience to new heights! Embrace the art of handwriting and unleash your creativity with this feature-rich application, powered by cutting-edge technologies. Saber's intuitive and modern interface makes it effortless to jot down notes, draw diagrams, or annotate PDFs with precision.

As I was beginning to make digital notes, I couldn't find any private open-source apps that fit my requirements so I ended up having to use a proprietary app. I decided to create Saber to give people a choice of a private open-source app that they can trust. Saber is completely open-source, meaning that anyone can audit the code to ensure that it is secure and private. Saber encrypts your data and can sync to any compatible server of your choice, giving you complete control over your data.

Do you like to make notes on a tablet then transfer them to your computer? Or perhaps you prefer to type your notes on a laptop and then annotate them on a tablet? Whatever your workflow, Saber has you covered with its multi-platform support, allowing you to access your notes anytime, anywhere, on any device. Saber is available on Android, iOS, Windows, macOS, and Linux, with your notes automatically synchronized across all your devices. And if you're offline, Saber will automatically sync your notes when you're back online.

Saber features the best digital highlighter you've ever used. Have you ever needed to highlight multiple lines but hated the way the highlighter would overlap and change color? Saber utilizes advanced graphics processing to handle overlaps and maintain pen color consistency, giving you a highlighter experience better than traditional paper.

Saber has everything you need to keep your notes organized. Create folders inside folders inside folders to your heart's content with no limit on the number of nested folders. And even though a note may be buried deep within a nested folder, you can still access it easily with your most recent notes always available on the home screen.

Saber can intelligently invert your notes when you're in dark mode. This means that you can experience the entire note-taking experience in dark mode, including your images, for a soothing and cohesive interface in low-light environments.

Discover a whole new way to capture and organize your thoughts with Saber. Whether you're a student, professional, or creative mind, Saber is your trusted companion for digital handwriting. Download now and let your ideas flow freely!

[<img src='https://github.com/adil192/saber/blob/main/assets_raw/badges/google-play-badge.png'
    alt='Get it on Google Play'
    height=80>][google_play]
&nbsp;
[<img src="https://github.com/adil192/saber/blob/main/assets_raw/badges/f-droid-badge.png"
    alt="Get it on F-Droid"
    height=80>][f-droid]
&nbsp;
[<img src="https://github.com/adil192/saber/blob/main/assets_raw/badges/app-store-badge.svg"
    alt="Download on the App Store"
    height=80>][app_store]
&nbsp;
[<img src="https://github.com/adil192/saber/blob/main/assets_raw/badges/windows-badge.png"
    alt="Download for Windows"
    height=80>][download_windows]
&nbsp;
[<img src="https://github.com/adil192/saber/blob/main/assets_raw/badges/flathub-badge.svg"
    alt="Download on Flathub"
    height=80>][flathub]
&nbsp;
[<img src="https://github.com/adil192/saber/blob/main/assets_raw/badges/appimage-logo.png"
    alt="Get it as an AppImage"
    height=80>][download_appimage]
&nbsp;
[<img src="https://github.com/adil192/saber/blob/main/assets_raw/badges/snap-badge.png"
    alt="Get it from the Snap Store"
    height=80>][snap]

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/adil192/saber)](https://github.com/adil192/saber/releases/latest)
[![Flathub](https://img.shields.io/flathub/v/com.adilhanney.saber)](https://flathub.org/apps/details/com.adilhanney.saber)
[![F-Droid](https://img.shields.io/f-droid/v/com.adilhanney.saber)](https://f-droid.org/en/packages/com.adilhanney.saber/)
[![GitHub all releases](https://img.shields.io/github/downloads/adil192/saber/total?label=GitHub%20downloads)](https://github.com/adil192/saber/releases)
[![Flathub](https://img.shields.io/flathub/downloads/com.adilhanney.saber?label=Flathub%20downloads)](https://flathub.org/apps/details/com.adilhanney.saber)
[![GitHub Sponsors](https://img.shields.io/github/sponsors/adil192)](https://github.com/sponsors/adil192)
[![GitHub](https://img.shields.io/github/license/adil192/saber)](https://github.com/adil192/saber/blob/main/LICENSE.md)
[![codecov](https://codecov.io/gh/adil192/saber/branch/main/graph/badge.svg?token=EGQSN0THW2)](https://codecov.io/gh/adil192/saber)
[![CodeFactor](https://www.codefactor.io/repository/github/adil192/saber/badge/main)](https://www.codefactor.io/repository/github/adil192/saber/overview/main)

<details open>
<summary>Tap to show/hide screenshots</summary>

<div>
<img src="https://github.com/adil192/saber/raw/main/metadata/en-US/images/phoneScreenshots/home.png" width="250">
<img src="https://github.com/adil192/saber/raw/main/metadata/en-US/images/phoneScreenshots/editor.png" width="250">
<img src="https://github.com/adil192/saber/raw/main/metadata/en-US/images/phoneScreenshots/settings.png" width="250">
</div>
</details>

## Features

Please see [#1 Saber progress][progress].

## Install

<details>
<summary>Tap to show/hide install instructions</summary>

#### Android

Options:

1. Download from the [Play Store][google_play]

2. Download from [F-Droid][f-droid]
   - Note that the F-Droid build is not optimised for Onyx Boox devices as this would require
     [proprietary dependencies](https://github.com/adil192/saber/issues/219) from Onyx.

3. Download and install `Saber_{version}.apk` from the latest [Release][releases].

#### Linux

Option 1 (recommended):
Install the flatpak from [Flathub][flathub]: `flatpak --user install com.adilhanney.saber`.

Option 2:
Download `Saber-{version}-x86_64.AppImage` from the latest [Release][releases],
make it executable with `chmod +x Saber-*-x86_64.AppImage`, then run it.

Option 3:
There's an unofficial [snap][snap] available thanks to @soumyaDghosh.
`sudo snap install saber`

#### Windows

Download and install `SaberInstaller_{version}.exe` from the latest [Release][releases].

If you get missing dll errors, make sure you have [Visual C++ Redistributable](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist) installed.

#### iOS and macOS

Download Saber on the [App Store][app_store].

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

### 4. Install additional dependencies

Setup for the [super_clipboard](https://pub.dev/packages/super_clipboard)
package can be summarised as:
- Install [Rust](https://www.rust-lang.org/tools/install)
- Install NDK 25.2.9519653 if you're building for Android

### 5. Build for...

#### Linux

`sudo apt install libsecret-1-dev libjsoncpp-dev`
`flutter build linux`

This is good enough for using on your own computer, but if you want to redistribute your build,
you need to use a predictable environment: fork this repo and use the GitHub Action
[Build for Linux](https://github.com/adil192/saber/actions/workflows/linux.yml) instead.

#### Android

`flutter build apk`

You may need to generate a signing certificate and create the `android/key.properties` file.
More information on https://docs.flutter.dev/deployment/android#create-an-upload-keystore

Note: F-Droid releases are built slightly differently:
`./patches/remove_proprietary_dependencies.sh`
`flutter build apk -t lib/main_fdroid.dart`

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

All translations are crowd-sourced. Saber has so far been translated into:
- English ([en](https://github.com/adil192/saber/blob/main/lib/i18n/strings.i18n.yaml))
- Arabic ([ar](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_ar.i18n.yaml))
- Czech ([cs](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_cs.i18n.yaml))
- German ([de](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_de.i18n.yaml))
- Spanish ([es](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_es.i18n.yaml))
- Persian ([fa](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_fa.i18n.yaml))
- French ([fr](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_fr.i18n.yaml))
- Hungarian ([hu](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_hu.i18n.yaml))
- Italian ([it](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_it.i18n.yaml))
- Japanese ([ja](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_ja.i18n.yaml))
- Brazilian Portuguese ([pt_BR](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_pt_BR.i18n.yaml))
- Russian ([ru](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_ru.i18n.yaml))
- Turkish ([tr](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_tr.i18n.yaml))
- Chinese Simplified ([zh_Hans-CN](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_zh_Hans-CN.i18n.yaml))
- Chinese Traditional ([zh_Hant-TW](https://github.com/adil192/saber/blob/main/lib/i18n/community/strings_zh_Hant-TW.i18n.yaml))

### Extending existing languages

Check [_missing_translations.yaml](https://github.com/adil192/saber/blob/main/lib/i18n/_missing_translations.yaml)
   to see if any translations are missing.

1. Use [this link](https://github.com/adil192/saber/edit/main/lib/i18n/_missing_translations.yaml)
   to edit `_missing_translations.yaml`.
2. Update your `_missing_translations.yaml` file with your translations, e.g. updating German (de)
    ```yaml
    de:
      editor:
        newerFileFormat:
          title: Diese Notiz wurde mit einer neueren Version von Saber bearbeitet
          subtitle: Wenn du diese Notiz bearbeitest, können Daten verloren gehen. Möchtest du die Notiz trotzdem öffnen?
          openAnyway: Trotzdem öffnen
          cancel: Abbruch
    # ignore the other languages...
    ```
3. Open a pull request! I'll do the rest

### Adding a new language

1. Look for your locale code [here](https://saimana.com/list-of-country-locale-code/),
   e.g. `hi` for Hindi, `fr` for French, `bn` for Bengali, `ar` for Arabic, etc.
2. Use [this link](https://github.com/adil192/saber/new/main/lib/i18n/community)
   to create a new file in `lib/i18n/community/` called `strings_XX.i18n.yaml`
   where `XX` is your locale code.
3. Copy the contents of an existing file like
   [`lib/i18n/strings.i18n.yaml`](https://github.com/adil192/saber/blob/main/lib/i18n/strings.i18n.yaml)
   and replace the translations with your own.
   If you don't know the translation for a string, just delete the line.
4. Open a pull request!

Also see [`slang`'s Getting Started](https://pub.dev/packages/slang#getting-started) for more information.

### Translating app store descriptions

We have 2 formats for app store descriptions:

1. F-Droid/Play Store:

   i. Open `metadata/en-US/` and copy the
      [`full_description.txt`](https://github.com/adil192/saber/blob/main/metadata/en-US/full_description.txt)
      and
      [`short_description.txt`](https://github.com/adil192/saber/blob/main/metadata/en-US/short_description.txt)
      files into the `metadata/XX/` folder where `XX` is your locale code.
      Then translate the contents of the files.

   ii. Changelogs are automatically translated from the English version.
       If you spot a mistake, please edit the translated changelog in
       `metadata/XX/changelogs/<version-code>.txt` where `XX` is your locale code.

2. Linux .desktop file:

   i. Open
   [`flatpak/com.adilhanney.saber.desktop`](https://github.com/adil192/saber/blob/main/flatpak/com.adilhanney.saber.desktop)
   and add a line for the `Comment` key with the following format where `XX` is your locale code:
    ```ini
    Comment[XX]=Your translation
    ```
   If you also need to translate the `Name` key, do the same thing.

3. Flathub (optional):

   i. Since this is slightly more technical, you can skip the Flathub part if you
      want to and I'll copy the translations from the above section.
   
   ii. In [`flatpak/com.adilhanney.saber.metainfo.xml`](https://github.com/adil192/saber/blob/main/flatpak/com.adilhanney.saber.metainfo.xml)
       before the `</description>` closing tag, add a line for your translation
       with the following format where `XX` is your locale code:
    ```html
    <p xml:lang="XX">Your translation</p>
    ```

   iii. In the same file, you can translate the changelogs by doing the same
        thing in the `<release>` tags before their `</description>` closing tag.


## Supporting Saber

If you like Saber, please consider supporting it by:
- Spreading the word!
- Starring the project on GitHub
- Sponsoring me on [GitHub Sponsors](https://github.com/sponsors/adil192)
- Donating via [PayPal](https://paypal.me/adilhanney)
- Buying more storage on the Nextcloud server: see [Pricing](pricing.md)

## Development notes

<details>
<summary>Show/hide development notes</summary>

- When updating the **app version**:
  - Run `./scripts/apply_version.sh <version-name> <version-code>`
    (Run `./scripts/apply_version.sh --help` for more info)
  - Update the changelogs in `metadata/en-US/changelogs/`
    and `flatpak/com.adilhanney.saber.metainfo.xml`,
    and run `dart scripts/translate_changelogs.dart` as directed by the script.
- When updating the **icons**, run the following commands:
  - General: `dart run icons_launcher:create`
  - Flatpak icons: `cd assets/icon && ./resize-icon.sh`
- When updating the **translations**...
  - Run the following commands:
    - `dart run slang apply --locale=XX` if you need to apply _missing_translations.yaml
    - `dart run slang`
    - `dart run slang analyze --full`
  - If you're adding a new language, update:
    - `CFBundleLocalizations` in `ios/Runner/Info.plist`
    - `CFBundleLocalizations` in `macos/Runner/Info.plist`
    - `android/app/src/main/res/xml/locales_config.xml`
    - `lib/data/locales.dart`
    - `README.md` above in the "Translating" section.
    - and run `dart scripts/translate_changelogs.dart` to translate the changelog.

</details>

[f-droid]: https://f-droid.org/packages/com.adilhanney.saber/
[flathub]: https://flathub.org/apps/details/com.adilhanney.saber
[google_play]: https://play.google.com/store/apps/details?id=com.adilhanney.saber
[snap]: https://snapcraft.io/saber
[app_store]: https://apps.apple.com/us/app/saber/id1671523739
[download_windows]: https://github.com/adil192/saber/releases/download/v0.15.2/SaberInstaller_v0.15.2.exe
[download_appimage]: https://github.com/adil192/saber/releases/download/v0.15.2/Saber-0.15.2-x86_64.AppImage

[nextcloud]: https://nc.saber.adil.hanney.org/

[privacy]: https://github.com/adil192/saber/blob/main/privacy_policy.md
[license]: https://github.com/adil192/saber/blob/main/LICENSE.md

[releases]: https://github.com/adil192/saber/releases
[issues]: https://github.com/adil192/saber/issues
[progress]: https://github.com/adil192/saber/discussions/1
