#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:intl/intl.dart';
import 'package:saber/data/version.dart' as old_version_file;

final oldVersion = Version.fromName(old_version_file.buildName);
late final Version newVersion;
late final String editor;

const String dummyChangelog = 'Release_notes_will_be_added_here';

Future<void> main(List<String> args) async {
  parseArgs(args);
  await findEditor();
  await updateAllFiles();
}

void parseArgs(List<String> args) {
  final parser = ArgParser()
    ..addFlag('major', abbr: 'M', negatable: false, help: 'Bump major version')
    ..addFlag('minor', abbr: 'm', negatable: false, help: 'Bump minor version')
    ..addFlag('patch', abbr: 'p', negatable: false, help: 'Bump patch version')
    ..addOption(
      'custom',
      abbr: 'c',
      help: 'Use custom version number, separated with dots',
    )
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show help');
  final results = parser.parse(args);

  if (results.flag('help')) {
    print(parser.usage);
    exit(0);
  } else if (results.flag('major')) {
    newVersion = oldVersion.bumpMajor();
  } else if (results.flag('minor')) {
    newVersion = oldVersion.bumpMinor();
  } else if (results.flag('patch')) {
    newVersion = oldVersion.bumpPatch();
  } else if (results.option('custom') != null) {
    newVersion = Version.fromName(results['custom']!);
  } else {
    print('No version bump type specified');
    print(parser.usage);
    exit(1);
  }

  print(
      'Bumping version from ${oldVersion.buildName} to ${newVersion.buildName}');
}

Future<void> findEditor() async {
  final whichCode = await Process.run('which', ['code']);
  if (whichCode.exitCode == 0) {
    editor = 'code';
    print('Using Visual Studio Code as editor');
    return;
  }

  final env = Platform.environment['EDITOR'];
  if (env != null) {
    editor = env;
    print('Using $editor as editor');
    return;
  }

  print('No editor found. Please set the EDITOR environment variable');
  exit(3);
}

Future<void> updateAllFiles() async {
  // update windows installer
  await File('installers/desktop_inno_script.iss').replace({
    // e.g. #define MyAppVersion "0.5.5"
    RegExp(r'#define MyAppVersion .+'):
        '#define MyAppVersion "${newVersion.buildName}"',
  });

  // update windows runner
  await File('windows/runner/Runner.rc').replace({
    // e.g. #define VERSION_AS_NUMBER 0,5,5,0
    RegExp(r'#define VERSION_AS_NUMBER .+'):
        '#define VERSION_AS_NUMBER ${newVersion.buildNameWithCommas},0',
    // e.g. #define VERSION_AS_STRING "0.5.5.0"
    RegExp(r'#define VERSION_AS_STRING .+'):
        '#define VERSION_AS_STRING "${newVersion.buildName}.0"',
  });

  // update version file
  await File('lib/data/version.dart').replace({
    // e.g. const int buildNumber = 5050;
    RegExp(r'buildNumber = .+;'): 'buildNumber = ${newVersion.buildNumber};',
    // e.g. const String buildName = '0.5.5';
    RegExp(r'buildName = .+;'): "buildName = '${newVersion.buildName}';",
    // e.g. const int buildYear = 2023;
    RegExp(r'buildYear = .+;'): 'buildYear = ${DateTime.now().year};',
  });

  // update pubspec
  await File('pubspec.yaml').replace({
    // e.g. version: 5.5.0+5050
    RegExp(r'version: .+'):
        'version: ${newVersion.buildName}+${newVersion.buildNumber}',
  });

  // update snap
  await File('snap/snapcraft.yaml').replace({
    // e.g. source-tag: 'v0.5.5'
    RegExp(r"source-tag: 'v.+"): "source-tag: 'v${newVersion.buildName}'",
  });

  // update download link in READMEs
  final readmes = Directory('.').listSync().whereType<File>().where(
      (file) => RegExp(r'README.*\.md').hasMatch(file.path.split('/').last));
  for (final readme in readmes) {
    await readme.replace({
      // e.g. [download_windows]: https://github.com/saber-notes/saber/releases/download/v0.11.0/SaberInstaller_v0.11.0.exe
      RegExp(r'\[download_windows\]: .+'):
          '[download_windows]: https://github.com/saber-notes/saber/releases/download/v${newVersion.buildName}/SaberInstaller_v${newVersion.buildName}.exe',
      // e.g. [download_appimage]: https://github.com/saber-notes/saber/releases/download/v0.11.0/Saber-0.11.0-x86_64.AppImage
      RegExp(r'\[download_appimage\]: .+'):
          '[download_appimage]: https://github.com/saber-notes/saber/releases/download/v${newVersion.buildName}/Saber-${newVersion.buildName}-x86_64.AppImage',
    });
  }

  // create metadata changelog
  final changelogFile =
      File('metadata/en-US/changelogs/${newVersion.buildNumber}.txt');
  if (changelogFile.existsSync()) {
    print('Changelog file already exists');
  } else {
    print('Creating a blank changelog file');
    await changelogFile.writeAsString('• $dummyChangelog\n');
  }

  // update flatpak changelog
  final flatpakFile = File('flatpak/com.adilhanney.saber.metainfo.xml');
  if (await flatpakFile.contains(RegExp(RegExp.escape(newVersion.buildName)))) {
    print('<release> tag already exists in flatpak file');
  } else {
    print('Adding a new <release> tag to flatpak file');
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc());
    final releaseTag = '''
        <release version="${newVersion.buildName}" type="development" date="$date">
            <description>
                <ul>
                    <li>$dummyChangelog</li>
                </ul>
            </description>
        </release>''';
    final flatpakLines = await flatpakFile.readAsLines();
    final index =
        flatpakLines.indexWhere((line) => line.contains('<releases>')) + 1;
    flatpakLines.insert(index, releaseTag);
    if (flatpakLines.last.isNotEmpty) flatpakLines.add('');
    await flatpakFile.writeAsString(flatpakLines.join('\n'));
  }

  print('');
  print('Make sure to update the changelog files:');
  print('  - ${changelogFile.path}');
  print('  - ${flatpakFile.path}');
  print('And then run:');
  print('  - dart scripts/translate_changelogs.dart');
  print('Next steps:');
  print(
      '  - Add the new release to the App Store: https://appstoreconnect.apple.com/apps/1671523739/appstore');

  // open changelog files in editor
  await Process.run(editor, [changelogFile.path]);
  await Process.run(editor, [flatpakFile.path]);
}

extension on File {
  Future<bool> contains(RegExp pattern) async {
    final content = await readAsString();
    return pattern.hasMatch(content);
  }

  Future<void> replace(Map<RegExp, String> replacements) async {
    int matches = 0;
    final lines = await readAsLines();
    for (var i = 0; i < lines.length; i++) {
      for (final pattern in replacements.keys) {
        if (pattern.hasMatch(lines[i])) {
          matches++;
          lines[i] = lines[i].replaceFirst(pattern, replacements[pattern]!);
        }
      }
    }
    if (lines.last.isNotEmpty) lines.add('');
    await writeAsString(lines.join('\n'));
    print('Updated $path with $matches / ${replacements.length} replacements');
  }
}

class Version {
  final int major;
  final int minor;
  final int patch;
  final int revision;

  Version(this.major, this.minor, this.patch, [this.revision = 0])
      : assert(major >= 0 && major < 100),
        assert(minor >= 0 && minor < 100),
        assert(patch >= 0 && patch < 100),
        assert(revision >= 0 && revision < 10);

  factory Version.fromName(String name) {
    final parts = name.split('.');
    assert(parts.length == 3);
    return Version(
        int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));
  }

  String get buildName => '$major.$minor.$patch';
  String get buildNameWithCommas => '$major,$minor,$patch';
  int get buildNumber => revision + patch * 10 + minor * 1000 + major * 100000;

  Version bumpMajor() => Version(major + 1, 0, 0);
  Version bumpMinor() => Version(major, minor + 1, 0);
  Version bumpPatch() => Version(major, minor, patch + 1);
}
