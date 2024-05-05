import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/nextcloud/nc_login_step.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class NcLoginPage extends StatefulWidget {
  const NcLoginPage({super.key});

  static final Uri signupUrl = Uri.parse(
      'https://nc.saber.adil.hanney.org/index.php/apps/registration/');

  @override
  State<NcLoginPage> createState() => _NcLoginPageState();
}

class _NcLoginPageState extends State<NcLoginPage> {
  final log = Logger('_NcLoginPageState');

  late LoginStep step = LoginStep.waitingForPrefs;

  @override
  void initState() {
    waitForPrefs();
    super.initState();
  }

  Future<void> waitForPrefs() async {
    step = LoginStep.waitingForPrefs;

    if (!Prefs.url.loaded || !Prefs.username.loaded || !Prefs.ncPassword.loaded)
      await Future.wait([
        Prefs.url.waitUntilLoaded(),
        Prefs.username.waitUntilLoaded(),
        Prefs.ncPassword.waitUntilLoaded(),
        Prefs.encPassword.waitUntilLoaded(),
      ]);

    recheckCurrentStep();
  }

  void recheckCurrentStep() {
    final prevStep = step;

    if (Prefs.url.value.isEmpty ||
        Prefs.username.value.isEmpty ||
        Prefs.ncPassword.value.isEmpty) {
      step = LoginStep.nc;
    } else if (Prefs.encPassword.value.isEmpty) {
      step = LoginStep.enc;
    } else {
      step = LoginStep.done;
    }

    if (prevStep != step) if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight,
          title: Text(t.login.title),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: LinearProgressIndicator(
              value: step.progress,
              minHeight: 4,
            ),
          ),
        ),
        body: switch (step) {
          LoginStep.waitingForPrefs =>
            const Center(child: CircularProgressIndicator()),
          LoginStep.nc => NcLoginStep(recheckCurrentStep: recheckCurrentStep),
          _ => Text('$step, ${step.progress}'),
        });
  }
}

enum LoginStep {
  /// We're waiting for the Prefs to be loaded
  waitingForPrefs(0),

  /// The user needs to authenticate with the Nextcloud server
  nc(0.2),

  /// The user needs to provide their encryption password
  enc(0.6),

  /// The user is fully logged in
  done(1);

  const LoginStep(this.progress);

  /// The value used for the LinearProgressIndicator on this step
  final double progress;
}
