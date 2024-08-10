import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:saber/components/nextcloud/done_login_step.dart';
import 'package:saber/components/nextcloud/enc_login_step.dart';
import 'package:saber/components/nextcloud/nc_login_step.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';

class NcLoginPage extends StatefulWidget {
  const NcLoginPage({
    super.key,
    @visibleForTesting this.forceAppBarLeading = false,
  });

  /// Whether to force the AppBar to have a leading back button
  final bool forceAppBarLeading;

  static final Uri signupUrl = Uri.parse(
      'https://nc.saber.adil.hanney.org/index.php/apps/registration/');

  @override
  State<NcLoginPage> createState() => _NcLoginPageState();

  static LoginStep getCurrentStep() {
    if (!Prefs.url.loaded ||
        !Prefs.username.loaded ||
        !Prefs.ncPassword.loaded ||
        !Prefs.encPassword.loaded ||
        !Prefs.key.loaded ||
        !Prefs.iv.loaded) {
      return LoginStep.waitingForPrefs;
    }

    if (Prefs.username.value.isEmpty || Prefs.ncPassword.value.isEmpty) {
      return LoginStep.nc;
    }
    if (Prefs.encPassword.value.isEmpty ||
        Prefs.key.value.isEmpty ||
        Prefs.iv.value.isEmpty) {
      return LoginStep.enc;
    }
    return LoginStep.done;
  }
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

    if (!Prefs.url.loaded ||
        !Prefs.username.loaded ||
        !Prefs.ncPassword.loaded ||
        !Prefs.encPassword.loaded ||
        !Prefs.key.loaded ||
        !Prefs.iv.loaded)
      await Future.wait([
        Prefs.url.waitUntilLoaded(),
        Prefs.username.waitUntilLoaded(),
        Prefs.ncPassword.waitUntilLoaded(),
        Prefs.encPassword.waitUntilLoaded(),
        Prefs.key.waitUntilLoaded(),
        Prefs.iv.waitUntilLoaded(),
      ]);

    recheckCurrentStep();
  }

  void recheckCurrentStep() {
    final prevStep = step;
    step = NcLoginPage.getCurrentStep();

    if (prevStep != step) if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        title: Text(switch (step) {
          LoginStep.waitingForPrefs => '',
          LoginStep.done => t.profile.title,
          _ => t.login.title,
        }),
        leading: widget.forceAppBarLeading
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
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
        LoginStep.enc => EncLoginStep(recheckCurrentStep: recheckCurrentStep),
        LoginStep.done => DoneLoginStep(recheckCurrentStep: recheckCurrentStep),
      },
    );
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

  const LoginStep(this.progress) : assert(progress >= 0 && progress <= 1);

  /// The value used for the LinearProgressIndicator on this step
  final double progress;
}
