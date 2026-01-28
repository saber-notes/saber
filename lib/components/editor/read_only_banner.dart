import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:sbn/read_only_reason.dart';

/// A banner that tells the user why the note is read-only.
/// If [reason] is null, an empty widget is returned.
/// If [action] is provided, a trailing icon button will be shown.
class ReadOnlyBanner extends StatefulWidget {
  const ReadOnlyBanner(this.reason, {super.key, this.action});

  final ReadOnlyReason? reason;
  final VoidCallback? action;

  @override
  State<ReadOnlyBanner> createState() => _ReadOnlyBannerState();
}

class _ReadOnlyBannerState extends State<ReadOnlyBanner> {
  bool get needsBanner => switch (widget.reason) {
    null => false,
    .placeholder => false,
    _ => true,
  };
  late var hasShownBanner = needsBanner;

  var _lastSubtitle = '';
  String get subtitle => _lastSubtitle = switch (widget.reason) {
    null => _lastSubtitle,
    .placeholder => _lastSubtitle,
    .versionTooNew => t.editor.versionTooNew.title,
    .watchingServer => t.editor.readOnlyBanner.watchingServer,
    .corrupted => t.editor.readOnlyBanner.corrupted,
  };

  @override
  Widget build(BuildContext context) {
    hasShownBanner |= needsBanner;
    if (!hasShownBanner) return const SizedBox.shrink();

    return Collapsible(
      collapsed: !needsBanner,
      axis: CollapsibleAxis.vertical,
      child: SafeArea(
        child: ListTile(
          onTap: widget.action,
          leading: const Icon(Icons.edit_off),
          title: Text(t.editor.readOnlyBanner.title),
          subtitle: Text(subtitle),
          trailing: widget.action != null
              ? IconButton(
                  onPressed: widget.action,
                  icon: const Icon(Icons.open_in_new),
                )
              : null,
        ),
      ),
    );
  }
}
