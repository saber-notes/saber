import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/theming/adaptive_icon.dart';
import 'package:saber/components/theming/font_fallbacks.dart';
import 'package:saber/i18n/strings.g.dart';

final logsHistory = _LogsHistory();

class _LogsHistory extends ChangeNotifier {
  final _history = <LogRecord>[];

  /// A frozen copy of the history.
  List<LogRecord>? _frozenHistory;

  /// The history of log records. Do not modify this list directly.
  List<LogRecord> get history => _frozenHistory ?? _history;

  bool get isFrozen => _frozenHistory != null;

  void freeze() {
    _frozenHistory = List.unmodifiable(_history);
  }

  void unfreeze() {
    _frozenHistory = null;
  }

  void add(LogRecord record) {
    _history.add(record);
    notifyListeners();
  }

  void clear() {
    _history.clear();
    _frozenHistory = null;
    notifyListeners();
  }
}

class LogsPage extends StatelessWidget {
  const LogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: logsHistory,
        builder: (context, _) {
          final theme = Theme.of(context);
          final colorScheme = theme.colorScheme;
          final cupertino = theme.platform == TargetPlatform.iOS ||
              theme.platform == TargetPlatform.macOS;
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                collapsedHeight: kToolbarHeight,
                expandedHeight: 200,
                pinned: true,
                scrolledUnderElevation: 1,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    t.logs.logs,
                    style: TextStyle(color: colorScheme.onSurface),
                  ),
                  centerTitle: cupertino,
                ),
                actions: [
                  if (logsHistory.isFrozen)
                    IconButton(
                      icon: AdaptiveIcon(
                        icon: Icons.play_arrow,
                        cupertinoIcon: CupertinoIcons.play_arrow,
                      ),
                      onPressed: logsHistory.unfreeze,
                    )
                  else
                    IconButton(
                      icon: AdaptiveIcon(
                        icon: Icons.pause,
                        cupertinoIcon: CupertinoIcons.pause,
                      ),
                      onPressed: logsHistory.freeze,
                    ),
                  IconButton(
                    icon: AdaptiveIcon(
                      icon: Icons.copy,
                      cupertinoIcon: CupertinoIcons.doc_on_clipboard,
                    ),
                    onPressed: logsHistory.history.isEmpty
                        ? null
                        : () {
                            final buffer = StringBuffer();
                            for (final record in logsHistory.history) {
                              buffer.write(record.level.name);
                              buffer.write(' at ');
                              buffer.writeln(record.time);
                              buffer.writeln(record.message);
                              if (record.error != null)
                                buffer.writeln(record.error);
                              if (record.stackTrace != null)
                                buffer.writeln(record.stackTrace);
                              buffer.writeln();
                            }
                            Clipboard.setData(
                              ClipboardData(text: buffer.toString()),
                            );
                          },
                  ),
                ],
              ),
              if (logsHistory.history.isEmpty)
                SliverFillRemaining(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/undraw_detailed_analysis_re_tk6j.svg',
                          width: 300,
                          height: 300 * 570 / 925.49161,
                          excludeFromSemantics: true,
                        ),
                        const SizedBox(height: 64),
                        Text(
                          t.logs.noLogs,
                          style: TextStyle(
                            color: colorScheme.onSurface,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          t.logs.useTheApp,
                          style: TextStyle(color: colorScheme.onSurface),
                        ),
                      ],
                    ),
                  ),
                )
              else
                SliverList.builder(
                  itemCount: logsHistory.history.length,
                  itemBuilder: (context, index) {
                    if (index < 0 || index >= logsHistory.history.length) {
                      return const SizedBox();
                    }
                    return _LogsItem(
                      record: logsHistory
                          .history[logsHistory.history.length - 1 - index],
                    );
                  },
                ),
            ],
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
          if (record.stackTrace != null)
            DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xCC000000),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  record.stackTrace.toString(),
                  style: TextStyle(
                    fontFamily: 'FiraMono',
                    fontFamilyFallback: saberMonoFontFallbacks,
                    fontSize: 11,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
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
