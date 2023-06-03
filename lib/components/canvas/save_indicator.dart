import 'package:flutter/material.dart';

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
        SavingState.saving => const CircularProgressIndicator(),
        SavingState.saved => IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      },
    );
  }
}

enum SavingState {
  waitingToSave,
  saving,
  saved,
}
