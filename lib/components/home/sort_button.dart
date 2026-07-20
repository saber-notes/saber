import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:stow_codecs/stow_codecs.dart';

class BrowseSortButton extends HookWidget {
  const BrowseSortButton({super.key});

  void _openDialog(BuildContext context) async {
    final selection = await showDialog<SortMetric>(
      context: context,
      builder: (context) => _SortDialog(selected: stows.browseSortMetric.value),
    );
    if (selection == null) return;
    stows.browseSortMetric.value = selection;
  }

  @override
  Widget build(BuildContext context) {
    final sortMetric = useValueListenable(stows.browseSortMetric);
    return IconButton(
      padding: const .all(4),
      constraints: const BoxConstraints(
        minWidth: kMinInteractiveDimension,
        minHeight: kMinInteractiveDimension,
      ),
      onPressed: () => _openDialog(context),
      icon: sortMetric.icon,
    );
  }
}

class _SortDialog extends StatelessWidget {
  const _SortDialog({required this.selected});

  final SortMetric selected;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: .topEnd,
      insetPadding: const .all(8),
      title: Text(t.home.sort.sortBy),
      content: Column(
        mainAxisSize: .min,
        children: [
          for (final option in SortMetric.values)
            _SortDialogOption(sortMetric: option, selected: option == selected),
        ],
      ),
    );
  }
}

class _SortDialogOption extends StatelessWidget {
  const _SortDialogOption({required this.sortMetric, required this.selected});

  final SortMetric sortMetric;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pop(sortMetric);
      },
      leading: sortMetric.icon,
      title: Text(switch (sortMetric) {
        .nameAToZ => t.home.sort.nameAToZ,
        .nameZToA => t.home.sort.nameZToA,
        .lastModifiedNewToOld => t.home.sort.lastModifiedNewToOld,
        .lastModifiedOldToNew => t.home.sort.lastModifiedOldToNew,
      }),
      trailing: selected ? const Icon(Icons.check) : null,
      selected: selected,
      selectedTileColor: Colors.transparent,
    );
  }
}

enum SortMetric {
  nameAToZ,
  nameZToA,
  lastModifiedNewToOld,
  lastModifiedOldToNew;

  static const codec = EnumCodec(values);

  Widget get icon => switch (this) {
    .nameAToZ => const FaIcon(FontAwesomeIcons.arrowDownAZ),
    .nameZToA => const FaIcon(FontAwesomeIcons.arrowUpAZ),
    .lastModifiedNewToOld => const Icon(Icons.hourglass_bottom),
    .lastModifiedOldToNew => const Icon(Icons.hourglass_top),
  };
}
