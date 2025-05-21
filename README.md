# <img src="https://github.com/saber-notes/saber/raw/main/assets/icon/icon.png" width="30" height="30" alt="Logo"> Saber

[<img src='https://github.com/saber-notes/saber/blob/main/assets_raw/badges/google-play-badge.png'
    alt='Get it on Google Play'
    height=50>][google_play]
&nbsp;
[<img src="https://github.com/saber-notes/saber/blob/main/assets_raw/badges/f-droid-badge.png"
    alt="Get it on F-Droid"
    height=50>][f-droid]
&nbsp;
[<img src="https://github.com/saber-notes/saber/blob/main/assets_raw/badges/app-store-badge.svg"
    alt="Download on the App Store"
    height=50>][app_store]
&nbsp;
[<img src="https://github.com/saber-notes/saber/blob/main/assets_raw/badges/windows-badge.png"
    alt="Download for Windows"
    height=50>][download_windows]
&nbsp;
[<img src="https://github.com/saber-notes/saber/blob/main/assets_raw/badges/flathub-badge.svg"
    alt="Download on Flathub"
    height=50>][flathub]
&nbsp;
[<img src="https://github.com/saber-notes/saber/blob/main/assets_raw/badges/appimage-logo.png"
    alt="Get it as an AppImage"
    height=50>][download_appimage]

Unofficial packages:
[<img src="https://github.com/saber-notes/saber/blob/main/assets_raw/badges/snap-badge.svg"
    alt="Get it from the Snap Store"
    height=50>][snap]

[English](https://github.com/saber-notes/saber/blob/main/README.md) |
[čeština](https://github.com/saber-notes/saber/blob/main/README-cs.md) |
[Deutsch](https://github.com/saber-notes/saber/blob/main/README-de.md) |
[中文 (简体中文, 中国)](https://github.com/saber-notes/saber/blob/main/README-zh-CN.md) |
[中文 (繁體, 台灣)](https://github.com/saber-notes/saber/blob/main/README-zh-TW.md) |
[العربية](https://github.com/saber-notes/saber/blob/main/README-ar.md) 

Saber is the notes app built for handwriting.

It's designed to be as simple and intuitive as possible, while still delivering unique features that you'll actually use. Additionally, Saber is available across all your devices, large and small, and syncs between them seamlessly.

Notably, it can invert your notes when you're in dark mode. This allows you to write with white ink on a black background, which is much easier on the eyes in low-light environments like when the teacher turns off the lights in class.
Images and PDFs are also inverted, so you can still use a digital printout or a textbook without the fuss.

Saber uses a dual-password system to protect your notes from anyone but you, even if they have complete control over the server. You can safely store your notes on the official Saber server, another server, or even host your own!

The app is completely open-source so that anyone can view the source code and see exactly what it's doing and how it handles your data. Many other note-taking apps are closed-source and proprietary, meaning that their inner workings are a mystery to the public.

As someone who studies maths, highlighting multi-line equations was always a hassle with other apps, where the highlighter would change color when it overlapped with itself. Another problem I had was that in some apps, the highlighter would render on top of the text, fading it out and making it hard to read.
Saber's highlighter has no such issues. It utilizes canvas compositing to render the highlighter in a way that is consistent with/better than traditional paper, where it handles overlaps and maintains color consistency.

Saber has everything you need to keep your notes organized. Create folders inside folders inside folders to your heart's content with no limit on the number of nested folders. And even though a note may be buried deep within a nested folder, you can still access it easily with your most recent notes always available on the home screen.

Discover a whole new way to capture and organize your thoughts with Saber. Whether you're a student, professional, or creative mind, Saber is your trusted companion for digital handwriting. Download now and let your ideas flow freely!

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/saber-notes/saber)](https://github.com/saber-notes/saber/releases/latest)
[![Flathub](https://img.shields.io/flathub/v/com.adilhanney.saber)](https://flathub.org/apps/details/com.adilhanney.saber)
[![F-Droid](https://img.shields.io/f-droid/v/com.adilhanney.saber)](https://f-droid.org/en/packages/com.adilhanney.saber/)
[![GitHub all releases](https://img.shields.io/github/downloads/saber-notes/saber/total?label=GitHub%20downloads)](https://github.com/saber-notes/saber/releases)
[![Flathub](https://img.shields.io/flathub/downloads/com.adilhanney.saber?label=Flathub%20downloads)](https://flathub.org/apps/details/com.adilhanney.saber)
[![GitHub Sponsors](https://img.shields.io/github/sponsors/adil192)](https://github.com/sponsors/adil192)
[![GitHub](https://img.shields.io/github/license/saber-notes/saber)](https://github.com/saber-notes/saber/blob/main/LICENSE.md)
[![codecov](https://codecov.io/gh/saber-notes/saber/branch/main/graph/badge.svg?token=EGQSN0THW2)](https://codecov.io/gh/saber-notes/saber)

<details open>
<summary>Tap to show/hide screenshots</summary>

<div>
<img src="https://github.com/saber-notes/saber/raw/main/metadata/en-US/images/phoneScreenshots/1_home.png" width="180">
<img src="https://github.com/saber-notes/saber/raw/main/metadata/en-US/images/phoneScreenshots/2_editor.png" width="180">
<img src="https://github.com/saber-notes/saber/raw/main/metadata/en-US/images/phoneScreenshots/3_login.png" width="180">
<img src="https://github.com/saber-notes/saber/raw/main/metadata/en-US/images/phoneScreenshots/4_settings.png" width="180">
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
     [proprietary dependencies](https://github.com/saber-notes/saber/issues/219) from Onyx.

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
git clone https://github.com/saber-notes/saber.git
```
### 3. Get dependencies
```bash
flutter pub get
```

### 4. Install additional dependencies

Setup for the [super_clipboard](https://pub.dev/packages/super_clipboard)
package can be summarised as:
- Install [Rust](https://www.rust-lang.org/tools/install)
- Install NDK 26.1.10909125 if you're building for Android

### 5. Build for...

#### Linux

```bash
sudo apt install libsecret-1-dev libjsoncpp-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev webkit2gtk-4.1-dev
# Or for Fedora...
sudo dnf install libsecret-devel jsoncpp-devel gstreamer1-devel gstreamer1-plugins-base-devel webkit2gtk4.1-devel

flutter build linux
```

This is good enough for using on your own computer, but if you want to redistribute your build,
you need to use a predictable environment: fork this repo and use the GitHub Action
[Build for Linux](https://github.com/saber-notes/saber/actions/workflows/linux.yml) instead.

#### Android

`flutter build apk`

You may need to generate a signing certificate and create the `android/key.properties` file.
More information on https://docs.flutter.dev/deployment/android#create-an-upload-keystore

Note:
FOSS/[F-Droid][f-droid-manifest] builds are done slightly differently:
```bash
./patches/remove_proprietary_dependencies.sh
flutter build apk
```

#### Windows

`flutter build windows`

The Windows installer is created with [Inno Setup](https://jrsoftware.org/isinfo.php).
To create an installer of your own, run the above build command, then edit and run
[installers/desktop_inno_script.iss](https://github.com/saber-notes/saber/blob/main/installers/desktop_inno_script.iss)
with Inno Setup Compiler.

#### iOS and macOS

If you have a macOS computer, you can
[build for iOS](https://docs.flutter.dev/deployment/ios#create-an-app-bundle)
with `flutter build ipa` or
[build for macOS](https://docs.flutter.dev/deployment/macos#create-a-build-archive-with-xcode)
with `flutter build macos`.

If you don't, fork this repo and use the GitHub Action
[Build for macOS and iOS](https://github.com/saber-notes/saber/actions/workflows/apple.yml).
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
- English ([en](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings.i18n.yaml))
- Arabic ([ar](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_ar.i18n.yaml))
- Czech ([cs](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_cs.i18n.yaml))
- German ([de](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_de.i18n.yaml))
- Spanish ([es](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_es.i18n.yaml))
- Persian ([fa](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_fa.i18n.yaml))
- French ([fr](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_fr.i18n.yaml))
- Hebrew ([he](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_he.i18n.yaml))
- Hungarian ([hu](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_hu.i18n.yaml))
- Italian ([it](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_it.i18n.yaml))
- Japanese ([ja](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_ja.i18n.yaml))
- Brazilian Portuguese ([pt_BR](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_pt_BR.i18n.yaml))
- Russian ([ru](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_ru.i18n.yaml))
- Turkish ([tr](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_tr.i18n.yaml))
- Chinese Simplified ([zh_Hans_CN](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_zh_Hans_CN.i18n.yaml))
- Chinese Traditional ([zh_Hant_TW](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings_zh_Hant_TW.i18n.yaml))

I'm experimenting with using
[Weblate](https://hosted.weblate.org/projects/saber-notes/saber/)
to crowd-source translations. More information coming soon.

### Extending existing languages

Check [_missing_translations.yaml](https://github.com/saber-notes/saber/blob/main/lib/i18n/_missing_translations.yaml)
   to see if any translations are missing.

1. Use [this link](https://github.com/saber-notes/saber/edit/main/lib/i18n/_missing_translations.yaml)
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
2. Use [this link](https://github.com/saber-notes/saber/new/main/lib/i18n)
   to create a new file in `lib/i18n/` called `strings_XX.i18n.yaml`
   where `XX` is your locale code.
3. Copy the contents of an existing file like
   [`lib/i18n/strings.i18n.yaml`](https://github.com/saber-notes/saber/blob/main/lib/i18n/strings.i18n.yaml)
   and replace the translations with your own.
   If you don't know the translation for a string, just delete the line.
4. Open a pull request!

Also see [`slang`'s Getting Started](https://pub.dev/packages/slang#getting-started) for more information.

### Translating app store descriptions

We have 2 formats for app store descriptions:

1. F-Droid/Play Store:

   i. Open `metadata/en-US/` and copy the
      [`full_description.txt`](https://github.com/saber-notes/saber/blob/main/metadata/en-US/full_description.txt)
      and
      [`short_description.txt`](https://github.com/saber-notes/saber/blob/main/metadata/en-US/short_description.txt)
      files into the `metadata/XX/` folder where `XX` is your locale code.
      Then translate the contents of the files.

   ii. Changelogs are automatically translated from the English version.
       If you spot a mistake, please edit the translated changelog in
       `metadata/XX/changelogs/<version-code>.txt` where `XX` is your locale code.

2. Linux .desktop file:

   i. Open
   [`flatpak/com.adilhanney.saber.desktop`](https://github.com/saber-notes/saber/blob/main/flatpak/com.adilhanney.saber.desktop)
   and add a line for the `Comment` key with the following format where `XX` is your locale code:
    ```ini
    Comment[XX]=Your translation
    ```
   If you also need to translate the `Name` key, do the same thing.

3. Flathub (optional):

   i. Since this is slightly more technical, you can skip the Flathub part if you
      want to and I'll copy the translations from the above section.
   
   ii. In [`flatpak/com.adilhanney.saber.metainfo.xml`](https://github.com/saber-notes/saber/blob/main/flatpak/com.adilhanney.saber.metainfo.xml)
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
  - Run `./scripts/bump_version.sh <version-name> <version-code>`
    (Run `./scripts/bump_version.sh --help` for more info)
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
[download_windows]: https://github.com/saber-notes/saber/releases/download/v0.25.6/SaberInstaller_v0.25.6.exe
[download_appimage]: https://github.com/saber-notes/saber/releases/download/v0.25.6/Saber-0.25.6-x86_64.AppImage

[nextcloud]: https://nc.saber.adil.hanney.org/

[privacy]: https://github.com/saber-notes/saber/blob/main/privacy_policy.md
[license]: https://github.com/saber-notes/saber/blob/main/LICENSE.md

[releases]: https://github.com/saber-notes/saber/releases
[issues]: https://github.com/saber-notes/saber/issues
[progress]: https://github.com/saber-notes/saber/discussions/1

[f-droid-manifest]: https://gitlab.com/fdroid/fdroiddata/-/blob/master/metadata/com.adilhanney.saber.yml
