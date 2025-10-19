import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  const channel = 'stable';

  final allVersions =
      await Process.run('curl', [
            'https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json',
          ])
          .then((result) => result.stdout as String)
          .then((body) => jsonDecode(body) as Map<String, dynamic>);

  final submoduleCommit = await Process.run('git', [
    'rev-parse',
    '@:./submodules/flutter',
  ]).then((result) => result.stdout as String).then((commit) => commit.trim());
  final latestCommit = allVersions['current_release'][channel];

  final submoduleVersion = (allVersions['releases'] as List).firstWhere(
    (release) =>
        release['hash'] == submoduleCommit && release['channel'] == channel,
  )['version'];
  final latestVersion = (allVersions['releases'] as List).firstWhere(
    (release) =>
        release['hash'] == latestCommit && release['channel'] == channel,
  )['version'];

  if (submoduleVersion == latestVersion) {
    print('Flutter submodule ($submoduleVersion) is up to date!');
  } else {
    print(
      'Flutter submodule ($submoduleVersion) is out of date: '
      'Flutter $latestVersion is available on the $channel channel!',
    );
    exit(1);
  }
}
