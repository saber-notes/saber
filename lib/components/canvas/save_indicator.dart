import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/data/routes.dart';

/// Replaces the back button as the
/// [AppBar.leading] widget in the [AppBar]
/// to indicate the state of saving in the editor.
class SaveIndicator extends StatelessWidget {
  const SaveIndicator({
    super.key,
    required this.savingState,
    required this.triggerSave,
  });

  final ValueNotifier<SavingState> savingState;
  final VoidCallback triggerSave;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: savingState,
      builder: (context, isSaving, _) => switch (savingState.value) {
        SavingState.waitingToSave => IconButton(
          icon: const Icon(Icons.save),
          onPressed: triggerSave,
        ),
        SavingState.saving => const IconButton(
          icon: CircularProgressIndicator(),
          onPressed: null,
        ),
        SavingState.saved => IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => _back(context),
        ),
      },
    );
  }

  void _back(BuildContext context) {
    final navigator = Navigator.of(context);
    final isWhiteboard = !navigator.canPop();
    if (isWhiteboard) {
      // if on whiteboard, go to "recents" tab of home screen
      context.go(HomeRoutes.getRoute(0));
    } else {
      navigator.pop();
    }
  }
}

enum SavingState {
  waitingToSave,
  saving,
  saved,
}
