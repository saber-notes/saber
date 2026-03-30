# Phase 2 — TestFlight Delivery Foundation

## Phase Mission
Transition the **Devils Book** from a local developmental scaffold into a cloud-ready distributeable entity. This phase focuses on the "Sky Forge" (CI/CD) and "Identity" (Metadata) layer, ensuring that even as the core feature set stabilizes, the delivery pipeline is hardened for iPad TestFlight deployment.

---

## 1. Branch Strategy
- **Base Branch:** `devils-book-foundation`
- **Delivery Branch:** `delivery/testflight-foundation`
- **Sync Policy:** Rebase `delivery/testflight-foundation` onto `devils-book-foundation` daily. Do not merge feature noise into the delivery branch directly; only pull stabilization commits.

---

## 2. Planned File Changes
| Category | Files | Purpose |
| :--- | :--- | :--- |
| **CI/CD** | `codemagic.yaml` | Refining build hooks, environment groups, and artifact naming. |
| **Identity** | `ios/Runner/Info.plist` | Set `CFBundleDisplayName` and `CFBundleIdentifier` to match Project Devils Book. |
| **Metadata** | `docs/devils-book/51-testflight-checklist.md` | Define iPad-specific smoke-test (UI, Pencil, Gestures). |
| **Logic** | `pubspec.yaml` | Hook build numbers to CI environment variables safely. |
| **Assets** | `ios/Runner/Assets.xcassets/` | Placeholder icons to differentiate Devils Book from standard Saber builds. |

---

## 3. Pre-Compilation Actions (The "Now" Steps)
The following can be executed even if the `lib/` directory is currently experiencing static analysis errors or broken imports:

1.  **Environment Variable Hardening:** Define the Codemagic `app_store_credentials` group requirements.
2.  **Metadata Alignment:** Rename the app in `Info.plist` so it appears as "Devils Book" on the iPad home screen.
3.  **Smoke Test Definition:** Drafting the manual checklist for the first iPad Pro 12.9" / 11" real-world tests.
4.  **Codemagic Webhook Prep:** Configuring the trigger patterns to specifically watch the `delivery/*` branches.

---

## 4. Phase 2 Stages
1.  **Stage 1: Identity Forge** — Set bundle ID and app name.
2.  **Stage 2: Sky Forge Build-Test** — Run first cloud build (allowed to fail, but infrastructure should trigger).
3.  **Stage 3: iPad Smoke Test Doc** — Finalize the "10-minute pass" for real hardware.
4.  **Stage 4: Signing & Secrets Prep** — Document exact steps for .p12 and Provisioning Profile injection.

---

**Next Action:** Create `delivery/testflight-foundation` and move into **Stage 1: Identity Forge**.
