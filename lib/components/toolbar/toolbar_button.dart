
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:saber/data/prefs.dart';

class ToolbarIconButton extends StatelessWidget {
  const ToolbarIconButton({
    super.key,
    this.tooltip,
    this.selected = false,
    this.enabled = true,
    required this.onPressed,

    this.modal,

    required this.child,
  });

  static PersistentBottomSheetController? modalController;

  final String? tooltip;
  final bool selected;
  final bool enabled;
  final void Function(ToolbarIconButton button)? onPressed;

  final Widget? modal;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Ink(
      decoration: ShapeDecoration(
        color: (selected && enabled) ? colorScheme.primary : null,
        shape: const CircleBorder(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: IconButton(
        color: (selected && enabled) ? colorScheme.onPrimary : colorScheme.primary,
        disabledColor: colorScheme.onSurface.withOpacity(0.4),
        onPressed: (onPressed != null && enabled) ? () => onPressed!(this) : null,
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
      builder: (BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => modalController?.close(),
          child: Padding(
            padding: EdgeInsets.only(
              left: 8,
              right: 8,
              bottom: Prefs.editorToolbarAlignment.value == AxisDirection.down ? 58 : 0,
              top: Prefs.editorToolbarAlignment.value == AxisDirection.up ? 58 : 0,
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
                      child: Column(
                        children: [
                          // drag handle (https://m3.material.io/components/bottom-sheets/specs)
                          Container(
                            width: 32,
                            height: 4,
                            margin: const EdgeInsets.only(top: 8, bottom: 16),
                            decoration: BoxDecoration(
                              color: colorScheme.onSurface.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          modal!,
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    modalController!.closed.then((_) => modalController = null);
  }
}
