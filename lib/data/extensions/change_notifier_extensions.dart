import 'package:flutter/material.dart';

extension ChangeNotifierExtensions on ChangeNotifier {
  /// This is a hack to allow us to call [notifyListeners]
  /// which is usually protected.
  /// 
  /// In my (@adil192) opinion, [notifyListeners] should be public. See
  /// - https://github.com/flutter/flutter/issues/135478
  /// - https://github.com/flutter/flutter/issues/27448
  /// - https://github.com/flutter/flutter/issues/29958
  /// - etc.
  void notifyListenersPlease() {
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    notifyListeners();
  }
}
