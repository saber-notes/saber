# <img src="https://github.com/adil192/saber/raw/main/assets/icon/icon.png" width="30" height="30" alt="Logo"> Saber

A (work-in-progress) cross-platform libre notes app.

<img src="https://github.com/adil192/saber/raw/main/assets/screenshots/home.png" width="200"> <img src="https://github.com/adil192/saber/raw/main/assets/screenshots/settings.png" width="200">


## Features

Please see [#1 Saber progress](https://github.com/adil192/saber/discussions/1).

## Platforms

Currently supported:
- Linux (Flatpak)
- Android (soon to be on the [Play Store](https://play.google.com/store/apps/details?id=com.adilhanney.saber))
- Web ([saber.adil.hanney.org](https://saber.adil.hanney.org))

Planned support:
- Windows

## Install

Saber is still in early stages but if you'd like to check it out,
you can see the online PWA at [saber.adil.hanney.org](https://saber.adil.hanney.org).
If you'd like to run it as a native app, you can [build from source](#build-from-source) instead.

Update: you can now install a flatpak on Linux by downloading `Saber.flatpak` from the latest [Release](https://github.com/adil192/saber/releases) and running `flatpak --user install Saber.flatpak`.

## Build from source

1. Install flutter: https://docs.flutter.dev/get-started/install
2. Clone this project: `git clone https://github.com/adil192/saber.git`
3. Get dependencies: `flutter pub get`
4. - Build for Linux: `flutter build linux`
   - Build for Android: `flutter build apk`
   - Build for the web: `flutter build web`
