# 48: iOS Bundle Identifier Correction (Devils Book)

This document records the identity/signing correction pass performed on 2026-03-31 to align the iOS deployment target with the **Devils Book** branding.

## 1. Rationale
To ensure consistency across the App Store, TestFlight, and device installations, the bundle identifier was migrated from the legacy `com.adilhanney.saber` to the new official record: `devilsbook`.

## 2. Changed Files & Specific Corrections

| File Path | Correction |
| :--- | :--- |
| `ios/Runner.xcodeproj/project.pbxproj` | Updated `PRODUCT_BUNDLE_IDENTIFIER` to `devilsbook` (App) and `devilsbook.RunnerTests` (Tests). |
| `codemagic.yaml` | Updated `BUNDLE_ID` variable in the `ios-testflight` workflow. |
| `docs/devils-book/44-ios-release-identity.md` | Updated the "Bundle Identifier" specification. |
| `docs/devils-book/43-codemagic-testflight-setup.md` | Updated the manual App Store Connect prerequisites. |

## 3. Analysis & Remaining References

### iOS Directory
- **Scan Status**: ✅ Verified clean.
- **Reference**: No occurrences of `com.adilhanney.saber` remain in the `ios/` subtree.

### Global References
As per the focused scope and the "No Reckless Global Rename" directive, the following areas **still reference** `com.adilhanney.saber` and may require separate attention:
- **Android**: `android/app/build.gradle.kts` matches the legacy ID.
- **Linux/Desktop**: `linux/CMakeLists.txt`, `flatpak/`, and `snap/` configurations.
- **macOS**: `macos/Runner/Configs/AppInfo.xcconfig` matches the legacy ID.

## 4. Next Recommended Steps
- [ ] **Android Identity Sync**: Replicate this correction pass for the Android `applicationId` to maintain cross-platform parity.
- [ ] **macOS Identity Sync**: Update `macos/Runner/Configs/AppInfo.xcconfig` to `devilsbook`.
- [ ] **App Store Connect Verification**: Confirm that the `devilsbook` identifier is registered and active in the developer portal.
