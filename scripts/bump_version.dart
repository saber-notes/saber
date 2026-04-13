#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:saber/data/saber_version.dart';
import 'package:saber/data/version.dart' as old_version_file;

final oldVersion = SaberVersion.fromName(old_version_file.buildName);
late final SaberVersion newVersion;
late final String editor;
late final bool failOnChanges;
late final bool quiet;

const dummyChangelog = 'Release_notes_will_be_added_here';

enum ErrorCodes {
  noError(0),
  noVersionSpecified(1),
  noEditorFound(5),
  changesNeeded(10);

  const ErrorCodes(this.code);

  final int code;
}

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
      help: 'Use a custom buildName (e.g. 0.22.11) or buildNumber (e.g. 22110)',
    )
    ..addFlag(
      'fail-on-changes',
      abbr: 'f',
      negatable: false,
      help: 'Fail if any changes need to be made',
    )
    ..addFlag('quiet', abbr: 'q', negatable: false, help: 'Don\'t open editor')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show help');

  final results = parser.parse(args);

  failOnChanges = results.flag('fail-on-changes');
  quiet = results.flag('quiet');

  if (results.flag('help')) {
    print(parser.usage);
    exit(ErrorCodes.noError.code);
  } else if (results.flag('major')) {
    newVersion = oldVersion.bumpMajor();
  } else if (results.flag('minor')) {
    newVersion = oldVersion.bumpMinor();
  } else if (results.flag('patch')) {
    newVersion = oldVersion.bumpPatch();
  } else if (results.option('custom') != null) {
    final custom = results['custom']!;
    late final buildNumber = int.tryParse(custom);
    if (custom.contains('.')) {
      newVersion = .fromName(custom);
    } else if (buildNumber != null) {
      newVersion = .fromNumber(buildNumber);
    } else {
      print('Invalid custom version: $custom');
      print(parser.usage);
      exit(ErrorCodes.noVersionSpecified.code);
    }
  } else {
    print('No version specified');
    print(parser.usage);
    exit(ErrorCodes.noVersionSpecified.code);
  }

  print(
    'Bumping version from ${oldVersion.buildName} to ${newVersion.buildName}',
  );
}

Future<String> findEditor() async {
  if (quiet) {
    print('Will not open editor');
    return editor = 'echo';
  }

  final termProgram = Platform.environment['TERM_PROGRAM'];
  if (termProgram == 'zed') {
    print('Using Zed as editor');
    return editor = 'zed';
  } else if (termProgram == 'vscode') {
    print('Using Visual Studio Code as editor');
    return editor = 'code';
  }

  final whichCode = await Process.run('which', ['code']);
  if (whichCode.exitCode == 0) {
    print('Using Visual Studio Code as editor');
    return editor = 'code';
  }

  final env = Platform.environment['EDITOR'];
  if (env != null) {
    print('Using $editor as editor');
    return editor = env;
  }

  print('No editor found. Please set the EDITOR environment variable');
  exit(ErrorCodes.noEditorFound.code);
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
    (file) => RegExp(
      r'README.*\.md',
    ).hasMatch(file.path.split(RegExp(r'[\\/]')).last),
  );
  for (final readme in readmes) {
    await readme.replace({
      // e.g. [download_windows]: https://github.com/saber-notes/saber/releases/download/v0.11.0/SaberInstaller_v0.11.0.exe
      RegExp(
        r'\[download_windows\]: .+',
      ): '[download_windows]: https://github.com/saber-notes/saber/releases/download/v${newVersion.buildName}/SaberInstaller_v${newVersion.buildName}.exe',
      // e.g. [download_appimage]: https://github.com/saber-notes/saber/releases/download/v0.11.0/Saber-0.11.0-x86_64.AppImage
      RegExp(
        r'\[download_appimage\]: .+',
      ): '[download_appimage]: https://github.com/saber-notes/saber/releases/download/v${newVersion.buildName}/Saber-${newVersion.buildName}-x86_64.AppImage',
    });
  }

  // create metadata changelog
  final changelogFile = File(
    'metadata/en-US/changelogs/${newVersion.buildNumber}.txt',
  );
  if (changelogFile.existsSync()) {
    print('Changelog file already exists');
  } else {
    if (failOnChanges) {
      print('Failed: No changelog file found at ${changelogFile.path}');
      exit(ErrorCodes.changesNeeded.code);
    }
    print('Creating a blank changelog file');
    await changelogFile.writeAsString('• $dummyChangelog\n');
  }

  // update flatpak changelog
  final metainfoFile = File('flatpak/com.adilhanney.saber.metainfo.xml');
  final metainfoLines = await metainfoFile.readAsLines();
  final originalMetainfoLines = metainfoLines.toList();
  if (await metainfoFile.contains(newVersion.buildName)) {
    print('<release> tag already exists in flatpak file');
  } else {
    if (failOnChanges) {
      print('Failed: No release tag found at ${metainfoFile.path}');
      exit(ErrorCodes.changesNeeded.code);
    }
    print('Adding a new <release> tag to flatpak file');
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc());
    final releaseTag =
        '''
        <release version="${newVersion.buildName}" type="development" date="$date">
            <description>
                <ul>
                    <li>$dummyChangelog</li>
                </ul>
            </description>
        </release>''';
    final index =
        metainfoLines.indexWhere((line) => line.endsWith('<releases>')) + 1;
    metainfoLines.insert(index, releaseTag);
  }
  if (!failOnChanges) {
    // Skipped if we're running a test.
    _generateMetainfoDescription(metainfoLines);
    _generateMetainfoScreenshots(metainfoLines);
  }
  if (!listEquals(metainfoLines, originalMetainfoLines)) {
    if (failOnChanges) {
      print('Failed: Misc change found for ${metainfoFile.path}');
      exit(ErrorCodes.changesNeeded.code);
    }
    if (metainfoLines.last.isNotEmpty) metainfoLines.add('');
    await metainfoFile.writeAsString(metainfoLines.join('\n'));
  }

  print('');
  print('Make sure to update the changelog files:');
  print('  - ${changelogFile.path}');
  print('  - ${metainfoFile.path}');
  print('And then run:');
  print('  - ./scripts/translate_changelogs.dart');
  print('Next steps:');
  print(
    '  - Add the new release to the App Store: https://appstoreconnect.apple.com/apps/1671523739/appstore',
  );

  // open changelog files in editor
  if (!quiet) {
    await Process.run(editor, [changelogFile.path], runInShell: true);
    await Process.run(editor, [metainfoFile.path], runInShell: true);
  }
}

void _generateMetainfoDescription(List<String> metainfoLines) {
  var start =
      metainfoLines.indexWhere((line) => line.endsWith('<description>')) + 1;
  final end = metainfoLines.indexWhere(
    (line) => line.endsWith('</description>'),
  );
  assert(start > 0 && end > 0, '<description/> tag not found');

  metainfoLines.removeRange(start, end); // remove old changelog entries
  metainfoLines.insert(
    start++,
    '        <!--\n'
    '        DO NOT EDIT.\n'
    '        Any modifications will be overwritten.\n'
    '        This <description/> tag is generated by bump_version.dart from `metadata/*/full_description.txt`.\n'
    '        -->',
  );

  final localesWithFullDescription = Directory('metadata')
      .listSync()
      .whereType<Directory>()
      .where((dir) => !dir.path.endsWith('en-US'))
      .where(
        (dir) => dir.listSync().any(
          (file) => file.path.endsWith('/full_description.txt'),
        ),
      )
      .map((dir) => dir.path.split('/').last)
      .sorted();
  for (final localeCode in [null, ...localesWithFullDescription]) {
    final txtFile = File(
      'metadata/${localeCode ?? 'en-US'}/full_description.txt',
    );
    final paragraphs = txtFile.readAsLinesSync();
    final openTag = localeCode == null ? '<p>' : '<p xml:lang="$localeCode">';
    for (final paragraph in paragraphs) {
      if (paragraph.isEmpty) continue;
      metainfoLines.insert(start++, ' ' * 8 + openTag);
      metainfoLines.insert(start++, ' ' * 12 + paragraph);
      metainfoLines.insert(start++, ' ' * 8 + '</p>');
    }
    metainfoLines.insert(start++, '');
  }
}

void _generateMetainfoScreenshots(List<String> metainfoLines) {
  const catalogue = [
    (name: '1_home', caption: 'The home screen showing your recent notes'),
    (
      name: '2_editor',
      caption: 'The editor showing some notes from a maths lecture',
    ),
    (
      name: '3_login',
      caption:
          'The login page which asks which Nextcloud server you want to use',
    ),
    (
      name: '4_settings',
      caption: 'The settings page showing that the user is now logged in',
    ),
  ];
  final localesWithScreenshots = Directory('metadata')
      .listSync()
      .where((dir) => !dir.path.endsWith('en-US'))
      .where(
        (dir) => File(
          '${dir.path}/images/flathubScreenshots/1_home.png',
        ).existsSync(),
      )
      .map((dir) => dir.path.split('/').last)
      .sorted();

  var start =
      metainfoLines.indexWhere((line) => line.endsWith('<screenshots>')) + 1;
  final end = metainfoLines.indexWhere(
    (line) => line.endsWith('</screenshots>'),
  );
  assert(start > 0 && end > 0, '<screenshots/> tag not found');

  metainfoLines.removeRange(start, end); // remove old changelog entries
  metainfoLines.insert(
    start++,
    '        <!--\n'
    '        DO NOT EDIT.\n'
    '        Any modifications will be overwritten.\n'
    '        This <screenshots/> tag is generated by bump_version.dart.\n'
    '        -->',
  );

  for (final (:name, :caption) in catalogue) {
    final openTag = name.startsWith('1')
        ? '<screenshot type="default">'
        : '<screenshot>';
    const indent = '        ';
    metainfoLines.insert(start++, indent + openTag);
    metainfoLines.insert(start++, '$indent    <caption>$caption</caption>');
    metainfoLines.insert(
      start++,
      '$indent    <image>https://raw.githubusercontent.com/saber-notes/saber/main/metadata/en-US/images/flathubScreenshots/$name.png</image>',
    );
    for (final locale in localesWithScreenshots) {
      metainfoLines.insert(
        start++,
        '$indent    <image xml:lang="$locale">https://raw.githubusercontent.com/saber-notes/saber/main/metadata/$locale/images/flathubScreenshots/$name.png</image>',
      );
    }
    metainfoLines.insert(start++, '$indent</screenshot>');
  }
}

extension on File {
  Future<bool> contains(Pattern pattern) async {
    final content = await readAsString();
    return content.contains(pattern);
  }

  Future<void> replace(Map<RegExp, String> replacements) async {
    var matches = 0;
    final lines = await readAsLines();
    for (var i = 0; i < lines.length; i++) {
      for (final pattern in replacements.keys) {
        if (pattern.hasMatch(lines[i])) {
          matches++;
          final oldLine = lines[i];
          lines[i] = lines[i].replaceFirst(pattern, replacements[pattern]!);
          if (failOnChanges && lines[i] != oldLine) {
            print('Failed: Changes needed in $path');
            exit(ErrorCodes.changesNeeded.code);
          }
        }
      }
    }
    if (lines.last.isNotEmpty) lines.add('');
    await writeAsString(lines.join('\n'));

    if (matches >= replacements.length) {
      print('Updated $path with all $matches replacements');
    } else {
      print(
        'Updated $path with $matches out of ${replacements.length} '
        'replacements (${replacements.length - matches} missed)',
      );
    }
  }
}

bool listEquals<T>(List<T> list, List<T> other) {
  if (list.length != other.length) return false;
  for (var i = 0; i < list.length; i++) {
    if (list[i] != other[i]) return false;
  }
  return true;
}
