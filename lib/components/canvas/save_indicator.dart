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
      builder: (context, isSaving, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: IconButton(
            key: ValueKey(savingState.value),
            onPressed: () => _onPressed(context),
            icon: switch (savingState.value) {
              SavingState.waitingToSave => const Icon(Icons.save),
              SavingState.saving => const CircularProgressIndicator.adaptive(),
              SavingState.savedWithoutThumbnail => const Icon(Icons.arrow_back),
              SavingState.savedWithThumbnail => const Icon(Icons.arrow_back),
            },
          ),
        );
      },
    );
  }

  /// When the save/exit button is pressed
  void _onPressed(BuildContext context) {
    switch (savingState.value) {
      case SavingState.waitingToSave:
        triggerSave();
      case SavingState.saving:
        break;
      case SavingState.savedWithoutThumbnail:
        triggerSave(); // triggering save will be created thumbnail and then is finished editing
        _back(context);
      case SavingState.savedWithThumbnail:
        _back(context);
    }
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

  /// Saved, but the thumbnail still needs updating.
  /// (Thumbnails aren't created when auto-saving to avoid lag.)
  savedWithoutThumbnail,

  /// Saved, and the thumbnail is up-to-date.
  savedWithThumbnail,
}
