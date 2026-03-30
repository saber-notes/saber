# 43: Codemagic & TestFlight Setup Guide

This guide ensures that the [Devils Book](file:///media/yusuf/Data/DevilsBook) repository can be built and distributed to Apple TestFlight from a **no-Mac local environment** (Ubuntu/Linux) using Codemagic as the "Sky Forge".

## Objective
Enable a maintainer to trigger a TestFlight build of `com.adilhanney.saber` by simply pushing to a release branch, with no localized macOS provisioning required.

---

## 1. Apple-Side Prerequisites (Manual)
Before the first build can succeed, the following must be manually configured in [App Store Connect](https://appstoreconnect.apple.com):

1.  **App Creation**: Ensure an App named "Saber" (or similar) exists with Bundle ID `com.adilhanney.saber`.
2.  **API Key Generation**:
    *   Navigate to **Users and Access** > **Integrations** > **App Store Connect API**.
    *   Generate a new API Key with **App Manager** access.
    *   Download the `.p8` file (Private Key).
    *   Note the **Issuer ID** and **Key ID**.

---

## 2. Codemagic Environment Configuration
In the Codemagic UI, navigate to your project settings and create an Environment Variable Group named `app_store_credentials`.

Add the following variables:

| Variable Name | Description | Where to find it |
| :--- | :--- | :--- |
| `APP_STORE_CONNECT_KEY_IDENTIFIER` | The ID of your Generated API Key | App Store Connect Users & Access |
| `APP_STORE_CONNECT_ISSUER_ID` | Your App Store Connect Issuer ID | App Store Connect Users & Access |
| `APP_STORE_CONNECT_PRIVATE_KEY` | The **content** of your `.p8` file | Opened in a text editor |
| `CERTIFICATE_PRIVATE_KEY` | A self-generated private key for signing | Generated via OpenSSL on Linux |

> [!IMPORTANT]
> **Automatic Code Signing**: In Codemagic settings for the `ios-testflight` workflow, ensure you enable **Automatic Code Signing** and select the "App Store Connect" integration. This removes the need for you to manually manage `.mobileprovision` files.

---

## 3. Versioning Strategy
The [codemagic.yaml](file:///media/yusuf/Data/DevilsBook/saber/codemagic.yaml) is configured to:
1.  Read the **Version Name** (e.g., `1.32.0`) from [pubspec.yaml](file:///media/yusuf/Data/DevilsBook/saber/pubspec.yaml).
2.  Override the **Build Number** (e.g., `+132000`) with a combination of `PROJECT_BUILD_NUMBER + 100000`.

This ensures that every cloud build has a unique, incrementing identifier required by TestFlight, even if you never touch the local version string.

---

## 4. Triggering a TestFlight Build
The pipeline is set to ignite on two specific Git events:

*   **Branch Push**: Any push to a branch matching `release/*`.
*   **Tag Creation**: Any tag matching `v*` (e.g., `v1.32.1`).

### Step-by-Step Release Flow:
1.  Ensure all features are merged to `main`.
2.  Create a release branch: `git checkout -b release/v1.32.1`.
3.  Push: `git push origin release/v1.32.1`.
4.  Monitor the build on [Codemagic](https://codemagic.io).
5.  Once complete, the `.ipa` will be uploaded to App Store Connect and appear in your iPad's **TestFlight app** within minutes.

---

## 5. Developer Verification (No-Signing)
For daily coding, use the `ios-developer` workflow. This workflow:
- Triggers on every push to `main` or PR.
- Performs a `flutter build ios --debug --no-codesign`.
- Verifies that your code actually compiles for iOS architectures without wasting time on signing or cloud uploading.

---

> [!TIP]
> If a build fails with a "Signing Error," verify that your App Store Connect API Key has not expired and that your `BUNDLE_ID` in `codemagic.yaml` matches your App Store entry exactly.
