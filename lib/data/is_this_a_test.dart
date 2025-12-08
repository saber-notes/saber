import 'dart:io';

import 'package:flutter/foundation.dart';

/// Returns true if we're currently running in a test, not in a real app.
@pragma('vm:platform-const-if', !kDebugMode)
final isThisATest =
    kDebugMode && Platform.environment.containsKey('FLUTTER_TEST');
