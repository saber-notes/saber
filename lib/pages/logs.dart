import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/nextcloud/enc_login_step.dart';
import 'package:saber/i18n/strings.g.dart';

final logsHistory = _LogsHistory();

class _LogsHistory extends ChangeNotifier {
  final _history = <LogRecord>[];

  void add(LogRecord record) {
    _history.add(record);
    notifyListeners();
  }
}

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.logs.logs),
      ),
      body: AnimatedBuilder(
        animation: logsHistory,
        builder: (context, _) {
          return ListView.builder(
            itemCount: logsHistory._history.length,
            itemBuilder: (context, index) => _LogsItem(
              record: logsHistory._history[index],
            ),
          );
        },
      ),
    );
  }
}

class _LogsItem extends StatelessWidget {
  const _LogsItem({required this.record});

  final LogRecord record;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _LogLevel(level: record.level),
          Text(record.message),
        ],
      ),
    );
  }
}

class _LogLevel extends StatelessWidget {
  const _LogLevel({required this.level});

  final Level level;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: switch (level) {
          Level.SHOUT || Level.SEVERE => colorScheme.error,
          Level.WARNING => colorScheme.tertiary,
          _ => colorScheme.surfaceContainer,
        },
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        level.name,
        style: TextStyle(
          color: switch (level) {
            Level.SHOUT || Level.SEVERE => colorScheme.onError,
            Level.WARNING => colorScheme.onTertiary,
            _ => colorScheme.onSurface,
          },
        ),
      ),
    );
  }
}
