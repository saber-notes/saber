import 'package:flutter/material.dart';
import 'zoom_window_controller.dart';

class ZoomWindowStrip extends StatelessWidget {
  final ZoomWindowController controller;
  final Widget canvasSubtree; 
  final Function(Offset) onStripDragUpdate; 

  const ZoomWindowStrip({
    Key? key,
    required this.controller,
    required this.canvasSubtree,
    required this.onStripDragUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (!controller.isVisible) return const SizedBox.shrink();

        final stripHeight = 250.0;
        final screenWidth = MediaQuery.sizeOf(context).width;

        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: stripHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(color: Theme.of(context).dividerColor, width: 2),
              ),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, -2))
              ],
            ),
            child: Stack(
              children: [
                // Render the active document slice
                ClipRect(
                  child: Transform(
                    transform: Matrix4.identity()
                      ..scale(screenWidth / controller.targetRect.width, stripHeight / controller.targetRect.height)
                      ..translate(-controller.targetRect.left, -controller.targetRect.top),
                    child: IgnorePointer(
                      child: canvasSubtree,
                    ),
                  ),
                ),
                
                // Transparent gesture detector to intercept local touches
                GestureDetector(
                  // V1 Stub: Pipe gesture logic back
                  onPanStart: (details) {
                    final mappedOffset = controller.transformPoint(details.localPosition, Size(screenWidth, stripHeight));
                    onStripDragUpdate(mappedOffset);
                  },
                  onPanUpdate: (details) {
                    final mappedOffset = controller.transformPoint(details.localPosition, Size(screenWidth, stripHeight));
                    onStripDragUpdate(mappedOffset);
                  },
                  child: Container(color: Colors.transparent),
                ),
                
                // Close button
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: controller.toggleVisibility,
                    style: IconButton.styleFrom(backgroundColor: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
