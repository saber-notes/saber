@TestOn('linux || mac-os || windows')

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:process_run/shell.dart';
import 'package:saber/data/version.dart';

const String dummyChangelog = "Release notes will be added here.";

void main() {
  test("Check for dummy text in changelogs", () async {
    final File androidMetadata = File("metadata/en-US/changelogs/$buildNumber.txt");
    expect(await androidMetadata.exists(), true);
    final String androidMetadataContents = await androidMetadata.readAsString();
    expect(androidMetadataContents.contains(dummyChangelog), false, reason: "Dummy text found in Android changelog");

    final File flatpakMetadata = File("flatpak/com.adilhanney.saber.metainfo.xml");
    expect(await flatpakMetadata.exists(), true);
    final String flatpakMetadataContents = await flatpakMetadata.readAsString();
    expect(flatpakMetadataContents.contains(dummyChangelog), false, reason: "Dummy text found in Flatpak changelog");
  });

  test("Test that versions in code are valid", () async {
    // We will use git's history to see if ./apply_version.sh
    // changes anything. If it does, then the versions in the
    // code are not valid.

    final shell = Shell(verbose: false);

    // Initial commit to hide any unrelated changes...
    await shell.run("git add . \n git commit -m 'Test commit' --allow-empty");
    addTearDown(() async {
      // restore changes
      await shell.run("touch stash-me.txt \n" // make sure we can stash
          "git stash --include-untracked \n"
          "git stash drop");
      // undo initial commit
      await shell.run("git reset --soft HEAD@{2}");
    });

    // expect git to be clean
    final before = await shell.run("git status --porcelain");
    expect(before.outText.isEmpty, true, reason: "Git status is not initially clean");

    // Run `./apply_version.sh` to update the version in code...
    await shell.run("./apply_version.sh $buildName $buildNumber");

    // expect that script didn't need to change anything
    final after = await shell.run("git status --porcelain");
    expect(after.outText.isEmpty, true, reason: "./apply_version.sh found inconsistencies");
  });
}
