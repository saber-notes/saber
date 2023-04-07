
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextField extends StatefulWidget {
  const AdaptiveTextField({
    super.key,
    this.controller,
    this.autofillHints,
    this.placeholder,
    this.prefixIcon,
    this.isPassword = false,
    this.keyboardType,
    this.textInputAction,
    required this.focusOrder,
    this.validator,
  });

  final TextEditingController? controller;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final NumericFocusOrder focusOrder;
  final String? placeholder;
  final Widget? prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;

  @override
  State<StatefulWidget> createState() => _AdaptiveTextFieldState();
}

class _AdaptiveTextFieldState extends State<AdaptiveTextField> {
  bool obscureText = false;
  Widget? get suffixIcon {
    if (!widget.isPassword) return null;
    return IconButton(
      icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
      iconSize: 18,
      onPressed: () { setState(() { obscureText = !obscureText; }); },
    );
  }

  @override
  void initState() {
    obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    bool cupertino = theme.platform == TargetPlatform.iOS || theme.platform == TargetPlatform.macOS;

    TextInputType? keyboardType = widget.keyboardType;
    if (widget.isPassword) {
      if (obscureText) {
        keyboardType = null;
      } else {
        keyboardType = TextInputType.visiblePassword;
      }
    }

    if (cupertino) {
      return Row(
        children: [
          Expanded(
            child: FocusTraversalOrder(
              order: widget.focusOrder,
              child: CupertinoTextFormFieldRow(
                controller: widget.controller,
                autofillHints: widget.autofillHints,
                keyboardType: keyboardType,
                textInputAction: widget.textInputAction,
                obscureText: obscureText,
                decoration: BoxDecoration(
                  border: Border.all(color: colorScheme.onSurface.withOpacity(0.12)),
                  borderRadius: BorderRadius.circular(8),
                ),
                style: TextStyle(color: colorScheme.onSurface),
                placeholder: widget.placeholder,
                prefix: widget.prefixIcon != null ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: widget.prefixIcon,
                ) : null,
                validator: widget.validator,
              ),
            ),
          ),
          if (suffixIcon != null) Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: FocusTraversalOrder(
                order: NumericFocusOrder(widget.focusOrder.order + 100),
                child: suffixIcon!,
              ),
            ),
          ) else const SizedBox(height: 40),
        ],
      );
    } else {
      return FocusTraversalOrder(
        order: widget.focusOrder,
        child: TextFormField(
          controller: widget.controller,
          autofillHints: widget.autofillHints,
          keyboardType: keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: obscureText,
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.placeholder,
            labelStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.5)),
            prefixIcon: widget.prefixIcon,
            suffixIcon: suffixIcon != null ? FocusTraversalOrder(
              order: NumericFocusOrder(widget.focusOrder.order + 100),
              child: suffixIcon!,
            ) : null,
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: colorScheme.onSurface.withOpacity(0.12)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
    }
  }
}
