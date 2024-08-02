import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/theming/adaptive_toggle_buttons.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/pages/home/settings.dart';

class SettingsSelection<T extends num> extends StatefulWidget {
  const SettingsSelection({
    super.key,
    required this.title,
    this.subtitle,
    this.icon,
    this.iconBuilder,
    required this.pref,
    required this.options,
    this.afterChange,
    this.optionsWidth = 72,
    this.optionsHeight = 40,
  }) : assert(icon == null || iconBuilder == null,
            'Cannot set both icon and iconBuilder');

  final String title;
  final String? subtitle;
  final IconData? icon;
  final IconData? Function(T)? iconBuilder;

  final IPref<T> pref;
  final List<ToggleButtonsOption<T>> options;
  final ValueChanged<T>? afterChange;

  final double optionsWidth, optionsHeight;

  @override
  State<SettingsSelection> createState() => _SettingsSelectionState<T>();
}

class _SettingsSelectionState<T extends num>
    extends State<SettingsSelection<T>> {
  late FocusNode dropdownFocusNode =
      FocusNode(debugLabel: 'dropdownFocusNode(${widget.pref.key})');

  @override
  void initState() {
    widget.pref.addListener(onChanged);
    super.initState();
  }

  void onChanged() {
    widget.afterChange?.call(widget.pref.value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.options.any(
        (ToggleButtonsOption option) => widget.pref.value == option.value)) {
      if (kDebugMode)
        throw Exception(
            'SettingsSelection (${widget.pref.key}): Value ${widget.pref.value} is not in the list of values, set it to ${widget.options.first.value}?');
      widget.pref.value = widget.options.first.value;
    }

    IconData? icon = widget.icon;
    icon ??= widget.iconBuilder?.call(widget.pref.value);
    icon ??= Icons.settings;

    final expSelectionWidth = widget.options.length * widget.optionsWidth;
    final useDropdownInstead =
        MediaQuery.sizeOf(context).width * 0.48 < expSelectionWidth;

    return ListTile(
      onTap: () {
        if (useDropdownInstead) {
          dropdownFocusNode.requestFocus();
        } else {
          // cycle through options
          final int i = widget.options.indexWhere(
              (ToggleButtonsOption option) =>
                  option.value == widget.pref.value);
          widget.pref.value =
              widget.options[(i + 1) % widget.options.length].value;
        }
      },
      onLongPress: () {
        SettingsPage.showResetDialog(
          context: context,
          pref: widget.pref,
          prefTitle: widget.title,
        );
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      leading: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: FaIcon(icon, key: ValueKey(icon)),
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 18,
          fontStyle: widget.pref.value != widget.pref.defaultValue
              ? FontStyle.italic
              : null,
        ),
      ),
      subtitle:
          Text(widget.subtitle ?? '', style: const TextStyle(fontSize: 13)),
      trailing: !useDropdownInstead
          ? AdaptiveToggleButtons(
              value: widget.pref.value,
              options: widget.options,
              onChange: (T? value) {
                // setState is automatically called when the pref changes
                if (value != null) {
                  widget.pref.value = value;
                }
              },
              optionsWidth: widget.optionsWidth,
              optionsHeight: widget.optionsHeight,
            )
          : DropdownButton<T>(
              value: widget.pref.value,
              onChanged: (T? value) {
                if (value == null) return;
                widget.pref.value = value;
              },
              items: widget.options.map((ToggleButtonsOption<T> option) {
                return DropdownMenuItem<T>(
                  value: option.value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: option.widget,
                  ),
                );
              }).toList(),
              focusNode: dropdownFocusNode,
              borderRadius: BorderRadius.circular(32),
              underline: const SizedBox.shrink(),
            ),
    );
  }

  @override
  void dispose() {
    widget.pref.removeListener(onChanged);
    super.dispose();
  }
}
