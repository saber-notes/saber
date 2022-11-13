
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modals/modals.dart';
import 'package:saber/data/prefs.dart';

class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton({
    super.key,
    this.tooltip,
    this.selected = false,
    required this.onPressed,

    this.modal,

    required this.child,
  });

  final String? tooltip;
  final bool selected;
  final void Function(ToolbarIconButton button)? onPressed;

  final Widget? modal;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Ink(
      decoration: ShapeDecoration(
        color: selected ? colorScheme.primary : null,
        shape: const CircleBorder(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: IconButton(
        color: selected ? colorScheme.onPrimary : colorScheme.primary,
        onPressed: onPressed != null ? () => onPressed!(this) : null,
        tooltip: tooltip,
        iconSize: 20,
        splashRadius: 20,
        visualDensity: VisualDensity.compact,
        icon: child,
      ),
    );
  }

  openModal(BuildContext context) {
    if (modal == null) {
      if (kDebugMode) print("ToolbarIconButton.showModal() called on a button with no modal");
      return;
    }

    removeAllModals();
    showModal(ModalEntry.aligned(
      context,
      tag: "toolbarModal",

      alignment: Prefs.editorToolbarOnBottom.value ? Alignment.bottomCenter : Alignment.topCenter,

      barrierDismissible: true,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 58),
        child: SizedBox(
          width: double.infinity,
          height: 100,
          child: Material(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(8),
            child: Center(
              child: SingleChildScrollView(
                child: modal!,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
