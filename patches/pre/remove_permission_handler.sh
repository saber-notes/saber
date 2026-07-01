#!/usr/bin/env bash
# Remove the permission_handler dependency for Linux/Windows builds
# as it adds unnecessary native code.

echo -n "Removing permission_handler from pubspec.yaml: "
if grep -q permission_handler pubspec.yaml; then
  echo "found"
  sed -i -e '/permission_handler/d' pubspec.yaml
else
  echo "already done"
fi

echo -n "Removing permission_handler usage in file_manager.dart: "
if grep -q permission_handler lib/data/file_manager/file_manager.dart; then
  echo "found"
  # Remove import
  sed -i -e '/permission_handler/d' lib/data/file_manager/file_manager.dart
  # Remove `_requestPhotosPermission` function body
  sed -i '/static Future<bool> _requestPhotosPermission() async {/,/^  }/c\  static Future<bool> _requestPhotosPermission() => Future.value(true);' lib/data/file_manager/file_manager.dart
fi
