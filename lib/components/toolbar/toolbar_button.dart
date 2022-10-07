
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

    this.modalTag,
    this.modal,

    required this.child,
  }) : assert((modalTag == null) == (modal == null), "Both modalTag and modal must be null or non-null");

  final String? tooltip;
  final bool selected;
  final void Function(ToolbarIconButton button)? onPressed;

  final String? modalTag;
  final Widget? modal;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    final Widget button = Ink(
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

    if (modal != null) {
      return ModalAnchor(
        tag: modalTag!,
        child: button,
      );
    } else {
      return button;
    }
  }

  openModal(BuildContext context) {
    if (modal == null) {
      if (kDebugMode) print("ToolbarIconButton.showModal() called on a button with no modal");
      return;
    }

    removeAllModals();
    showModal(ModalEntry.anchored(
      context,
      tag: "${modalTag!}-modal",

      anchorTag: modalTag!,
      anchorAlignment: Prefs.editorToolbarOnBottom.value ? Alignment.topCenter : Alignment.bottomCenter,
      modalAlignment: Prefs.editorToolbarOnBottom.value ? Alignment.bottomCenter : Alignment.topCenter,
      offset: Offset(0, Prefs.editorToolbarOnBottom.value ? -10 : 10),

      barrierDismissible: true,

      child: modal!,
    ));
  }
}
