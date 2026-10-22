# Samsung S Pen remote Undo

A Bluetooth-capable Samsung S Pen can undo the latest editor change using a
button double-click. Enable **Samsung S Pen → Undo with the S Pen button** in
Saber settings, open **Configure S Pen actions**, and enable Saber in Samsung's
app actions with double-press mapped to **Undo**. Samsung's firmware may assign
an action to single-press too; set single-press to **None** if desired.

The Bluetooth remote action was tested with the pen outside the display's hover
range. Button handling near the display and the existing eraser behavior remain
separate. Pens without
Bluetooth remote support cannot send this action even if they support writing.

## Implementation

`spen_remote_actions.xml` declares Samsung RemoteActions. Samsung emits F12 for
Undo; `MainActivity` consumes its initial key-down and forwards `undo` through
`saber/spen`. Key-up and repeated key-down events do not invoke another Undo.
Flutter receives the command independently of text-field or keyboard focus.

The current editor subscribes until disposal and uses the existing Undo/history
implementation. The command is ignored while the preference is disabled, the
editor is read-only, or another route covers it. An empty history is already
handled by the existing Undo method. `spenRemoteUndo` is stored using Saber's
normal preferences and defaults to enabled.

The section is shown only on Android when the manufacturer is Samsung and the
device advertises `com.sec.feature.spen_usp`. This indicates S Pen support, not
Bluetooth capability of the specific paired pen. The system-settings link tries
Samsung's Bluetooth S Pen settings, general S Pen settings, and advanced features
in order. Missing or inaccessible activities fall through; if all fail, Saber
shows a localized error.

## Validation

Run:

```sh
flutter test test/spen_remote_test.dart test/stylus_test.dart test/undo_disables_autosave_test.dart
flutter analyze --no-pub
```

Widget tests cover one-change Undo without keyboard focus, empty history,
a covered editor, disabled preference, read-only notes, listener disposal,
settings toggling and unsupported devices. The adjacent regression tests cover
stylus drawing/erasing and pending autosave after Undo.

The earlier v1.36.1-based test build was installed alongside the original Saber
on a Galaxy Tab S9 (SM-X710), Android 16. The owner confirmed a real Bluetooth
double-click removed exactly the last of two strokes. The switch, disabled
behavior, preference persistence after process restart and Samsung settings link
were also checked. These are device results for that test build, not a claim
that every subsequent revision has been installed or physically retested.

This contribution was developed with an AI coding agent and manually tested by
the requesting tablet owner. AI involvement is disclosed for maintainer review;
acceptance under the project's contribution policy is not assumed.

On upstream main `55eec16` (v1.36.3), Flutter 3.47.7 / Dart 3.13.5:
16 targeted tests passed, full analysis reported no issues, and changed Dart
files passed formatting. The full suite had 304 passes and six PDF golden
failures. The same six failures were reproduced with unmodified upstream
source: v18_pencil, v19_pens, v19_quill_languages, v19_separate_assets,
v6_stress_test_179 and v9_quill. Expected images were not regenerated.

A fresh Android build of this rebased revision remains unverified: the Android
SDK repository available locally did not offer the required platform 37.
This limitation is separate from the earlier successfully built device test.
