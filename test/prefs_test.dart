import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saber/components/canvas/tools/stroke_properties.dart';
import 'package:saber/data/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/test_mock_channel_handlers.dart';

void main() {
  group("Test Prefs:", () {
    test("PlainPref<String>", () async {
      await testPref<String>(
        prefBuilder: () => PlainPref("testPlainPrefString", "default"),
        defaultValue: "default",
        alteredValue: "altered",
      );
    });
    test("PlainPref<bool>", () async {
      await testPref<bool>(
        prefBuilder: () => PlainPref("testPlainPrefBool", false),
        defaultValue: false,
        alteredValue: true,
      );
    });
    test("PlainPref<StrokeProperties>", () async {
      final defaultValue = StrokeProperties();
      await testPref<StrokeProperties>(
        prefBuilder: () => PlainPref("testPlainPrefStrokeProperties", defaultValue),
        defaultValue: defaultValue,
        alteredValue: defaultValue.copy()
          ..size = StrokeProperties.defaultSize / 2,
        useJson: true,
      );
    });

    test("EncPref", () async {
      await testPref(
        prefBuilder: () => EncPref("testEncPref", "default"),
        defaultValue: "default",
        alteredValue: "altered",
      );
    });
  });
}

/// Tests an [IPref] with value of type [T].
///
/// The [prefBuilder] is used to create a new instance of the pref.
/// The prefs value will be compared to [defaultValue] and [alteredValue],
/// before and after setting the value to [alteredValue].
///
/// This also tests if the pref is properly saved and loaded.
///
/// If [useJson] is true, the value after loading will be JSON encoded
/// before being compared to [alteredValue].
Future testPref<T>({
  required IPref<T> Function() prefBuilder,
  required T defaultValue,
  required T alteredValue,
  bool useJson = false,
}) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupMockFlutterSecureStorage();
  SharedPreferences.setMockInitialValues({});

  // Note that we won't use testingMode because we need the prefs to be saved
  // // Prefs.testingMode = true;
  // Note that we won't use Prefs.init() because we aren't using Pref's prefs
  // // Prefs.init();

  // Delete pref if it already exists
  var pref = prefBuilder();
  await pref.delete();

  // Check that pref.delete() is idempotent (doesn't throw an error)
  await pref.delete();

  // Re-instantiate the pref
  pref = prefBuilder();

  bool prefChanged = false;
  pref.addListener(() {
    prefChanged = true;
  });

  expect(pref.loaded, false);
  expect(pref.value, defaultValue);
  expect(prefChanged, false);

  await pref.waitUntilLoaded();
  expect(pref.loaded, true);
  expect(pref.value, defaultValue);
  expect(prefChanged, false);

  // Change the value
  pref.value = alteredValue;
  expect(pref.saved, false);
  expect(pref.value, alteredValue);
  expect(prefChanged, true);

  await pref.waitUntilSaved();
  expect(pref.saved, true);

  // Re-instantiate the pref and check that the value is the same
  pref = prefBuilder();
  expect(pref.loaded, false);
  expect(pref.value, defaultValue);
  await pref.waitUntilLoaded();
  expect(pref.loaded, true);
  if (useJson) {
    expect(json.encode(pref.value), json.encode(alteredValue));
  } else {
    expect(pref.value, alteredValue);
  }

  // Remove the pref from disk
  await pref.delete();
}
