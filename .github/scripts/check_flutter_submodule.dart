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

  final submoduleVersion = (allVersions['releases'] as List)
      .cast<Map<String, dynamic>>()
      .firstWhereOrNull(
        (release) =>
            release['hash'] == submoduleCommit && release['channel'] == channel,
      )?['version'];
  print('Submodule version: $submoduleVersion ($submoduleCommit)');
  final latestVersion = (allVersions['releases'] as List)
      .cast<Map<String, dynamic>>()
      .firstWhereOrNull(
        (release) =>
            release['hash'] == latestCommit && release['channel'] == channel,
      )?['version'];
  print('Latest version: $latestVersion ($latestCommit)');

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

extension _OrNull<T> on List<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}
