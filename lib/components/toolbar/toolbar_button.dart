
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

  static PersistentBottomSheetController? modalController;

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

    if (modalController != null) return modalController!.close();

    modalController = showBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      enableDrag: true,
      builder: (BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => modalController?.close(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            bottom: Prefs.editorToolbarOnBottom.value ? 58 : 0,
            top: Prefs.editorToolbarOnBottom.value ? 0 : 58,
          ),
          child: IntrinsicHeight(
            child: Material(
              elevation: 1,
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(8),
              child: GestureDetector(
                onTap: () {},
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: modal!,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    modalController!.closed.then((_) => modalController = null);
  }
}
