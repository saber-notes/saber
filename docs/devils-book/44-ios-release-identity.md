# 44: iOS Release Identity - Devils Book

This document summarizes the rebranding transformation from "Saber" to [Devils Book](file:///media/yusuf/Data/DevilsBook), specifically targeting the iOS TestFlight-ready persona.

## 1. What Was Rebranded (User-Visible)

### Apple Metadata
- **App Display Name**: Updated to `Devils Book` in `Info.plist`. This is the name that appears under the icon on the home screen.
- **Bundle Name**: Updated to `Devils Book`.

### In-App Strings
- **Application Title**: The `MaterialApp` title is now `Devils Book`.
- **Localization (`en.i18n.yaml`)**:
  - Home Screen: "Welcome to Devils Book".
  - Settings: "Check for Devils Book updates", "Custom Devils Book folder".
  - Login/Sync: "Please authorize Devils Book to access your Nextcloud account".
  - License/Copyright: Updated to `Devils Book © 2022-2026 Adil Hanney`.

### Visual Identity
- **App Icon**: A new premium icon was generated and deployed across all iOS/iPad/macOS resolutions.
  - **Motif**: A stylized gold fountain pen tip over a minimalist notebook silhouette.
  - **Aesthetic**: Obsidian Black background with Infernal Gold accents, reflecting a luxury writing instrument brand.

---

## 2. What Remains "Saber" (Internal)

To preserve build stability and package integrity, several internal components remain named "Saber":
- **Package Name**: `saber` (in `pubspec.yaml` and all Dart imports).
- **Bundle Identifier**: `com.adilhanney.saber` (to preserve App Store and Keychain associations).
- **Sub-packages**: `sbn` (Saber Binary Native).
- **CI/CD Paths**: Codemagic and GitHub paths still reference the original repository structure.

---

## 3. Storage Changes
The **`appRootDirectoryPrefix`** has been updated to `DevilsBook`. 

> [!WARNING]
> On environments like Linux/Windows, this will change the default folder name from `~/Documents/Saber` to `~/Documents/DevilsBook`. Existing users would need to manually migrate their notes or update their "Custom Folder" setting in TestFlight.

---

## 4. TestFlight Readiness Status

| Category | Status | Notes |
| :--- | :--- | :--- |
| **Icons** | ✅ Production-Grade | Premium AI-generated branding deployed. |
| **Metadata** | ✅ Verified | `Info.plist` reflects the new name. |
| **Strings** | ✅ Updated | English strings are 100% rebranded. |
| **Stability** | ⚠️ Cleanup Required | Some internal `style` requirement errors from Stage 2 still need stabilization before a successful build. |

---

> [!IMPORTANT]
> **Identity Commitment**: The app now successfully presents as a specialized writing instrument tool. No "nib wear" or "ink degradation" mechanics were introduced, maintaining the product's core functional promises.
