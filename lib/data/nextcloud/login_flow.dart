import 'dart:async';
import 'dart:io';

import 'package:flutter_web_auth_2/flutter_web_auth_2.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:nextcloud/core.dart';
import 'package:nextcloud/nextcloud.dart';
import 'package:saber/data/nextcloud/nc_http_overrides.dart';
import 'package:saber/data/nextcloud/nextcloud_client_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class SaberLoginFlow {
  SaberLoginFlow.start({required this.serverUrl}) {
    NcHttpOverrides.tempAcceptBadCertificateFrom(serverUrl);
    unawaited(_run());
  }

  final Uri serverUrl;

  final log = Logger('SaberLoginFlow');
  Timer? _pollTimer;

  final completer = Completer<LoginFlowV2Credentials>();
  late final future = completer.future;

  LoginFlowV2? init;

  Future<void> openLoginUrl() async {
    final init = this.init;
    if (init == null) return;

    if (Platform.isMacOS || Platform.isIOS || Platform.isAndroid) {
      // Use FlutterWebAuth2 which returns to Saber when authenticated
      log.info('Opening login link in-app: ${init.login}');
      await FlutterWebAuth2.authenticate(
        url: init.login,
        callbackUrlScheme: 'nc',
      );
    } else {
      // Use url_launcher to open the link in the default browser
      log.info('Opening login link in browser: ${init.login}');
      final loginLink = Uri.parse(init.login);
      await launchUrl(loginLink);
    }
  }

  Future<void> _run() async {
    _catchHttpError(() async {
      final client = NextcloudClient(
        serverUrl,
        httpClient: NextcloudClientExtension.newHttpClient(),
      );
      final flowClient = client.core.clientFlowLoginV2;
      init = await flowClient.init().then((response) => response.body);
      log.info('init: $init');

      openLoginUrl();

      _pollTimer?.cancel();
      _pollTimer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => _catch404Error(() async {
          // Throws 404 if not logged in yet
          final poll = await flowClient.poll(
            $body: ClientFlowLoginV2PollRequestApplicationJson(
              (b) => b..token = init!.poll.token,
            ),
          );

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
