
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

/// Renders a native Android view which uses the Onyx SDK to draw on the screen.
class OnyxSdkPenArea extends StatelessWidget {
  const OnyxSdkPenArea({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  // todo: add event handlers

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || !Platform.isAndroid) return child;

    // This is used in the platform side to register the view.
    const String viewType = 'onyxsdk_pen_area';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return Stack(
      children: [
        Positioned.fill(
          child: child
        ),
        Positioned.fill(
          child: AndroidView(
            viewType: viewType,
            layoutDirection: TextDirection.ltr,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
            hitTestBehavior: PlatformViewHitTestBehavior.translucent,
          ),
        ),
      ],
    );
  }
}
