import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'onyxsdk_pen_platform_interface.dart';

/// Renders a native Android view which uses the Onyx SDK to draw on the screen.
class OnyxSdkPenArea extends StatefulWidget {
  const OnyxSdkPenArea({
    Key? key,
    this.refreshDelayMs = 1000,
    required this.child,
  }) : super(key: key);

  /// The delay after the pen stroke is finished before the screen is refreshed.
  ///
  /// Setting this too low will cause the screen to refresh while the user
  /// is still writing, which will make the screen get stuck in a half-drawn
  /// state.
  final int refreshDelayMs;

  final Widget child;

  @override
  State<OnyxSdkPenArea> createState() => _OnyxSdkPenAreaState();
}

class _OnyxSdkPenAreaState extends State<OnyxSdkPenArea> {
  static bool? _isOnyxDevice;
  bool get isOnyxDevice {
    if (_isOnyxDevice != null) return _isOnyxDevice!;

    if (kIsWeb || !Platform.isAndroid) return _isOnyxDevice = false;

    // use the platform interface to check if the device is an Onyx device
    OnyxsdkPenPlatform.instance.isOnyxDevice().then((isOnyxDevice) {
      if (isOnyxDevice != _isOnyxDevice) {
        setState(() {
          _isOnyxDevice = isOnyxDevice;
        });
      }
    });

    // assume it's an Onyx device until we know otherwise
    return _isOnyxDevice = true;
  }

  @override
  Widget build(BuildContext context) {
    if (!isOnyxDevice) return widget.child;

    // This is used in the platform side to register the view.
    const String viewType = 'onyxsdk_pen_area';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{
      "refreshDelayMs": widget.refreshDelayMs,
    };

    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(
          opacity: 0,
          child: AndroidView(
            viewType: viewType,
            creationParams: creationParams,
            creationParamsCodec: const StandardMessageCodec(),
            gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
              Factory<OneSequenceGestureRecognizer>(
                () => EagerGestureRecognizer(),
              ),
            },
          ),
        ),
        widget.child,
      ],
    );
  }
}
