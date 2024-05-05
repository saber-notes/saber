import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/nextcloud.dart';

class SaberLoginFlow {
  SaberLoginFlow.start({
    required this.serverUrl,
  }) {
    unawaited(_run());
  }

  final Uri serverUrl;

  final log = Logger('SaberLoginFlow');
  Timer? _pollTimer;

  final completer = Completer<LoginFlowV2Credentials>();
  late final future = completer.future;

  Future<void> _run() async {
    _catchHttpError(() async {
      final client = NextcloudClient(serverUrl);
      final flowClient = client.core.clientFlowLoginV2;
      final init = await flowClient.init();
      log.info('init: ${init.body}');

      _pollTimer?.cancel();
      _pollTimer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _catch404Error(() async {
          // Throws 404 if not logged in yet
          final poll = await flowClient.poll(token: init.body.poll.token);

          _pollTimer?.cancel();
          if (!completer.isCompleted) completer.complete(poll.body);
        }),
      );
    });
  }

  Future<T?> _catchHttpError<T>(Future<T> Function() fn) async {
    try {
      return await fn();
    } on http.ClientException catch (error, stackTrace) {
      log.severe('Error while polling the login flow.', error, stackTrace);
      if (!completer.isCompleted) completer.completeError(error, stackTrace);
      return null;
    }
  }

  Future<T?> _catch404Error<T>(Future<T> Function() fn) async {
    try {
      return await fn();
    } on DynamiteStatusCodeException catch (error) {
      if (error.statusCode != 404) rethrow;

      log.fine('Login flow not found or completed yet, will repoll');
      return null;
    }
  }

  void dispose() {
    _pollTimer?.cancel();
    if (!completer.isCompleted)
      completer.completeError(TimeoutException('Login flow was disposed'));
  }
}
