import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:saber/data/prefs.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:stow_codecs/stow_codecs.dart';

class HomeLayoutButton extends HookWidget {
  const HomeLayoutButton({super.key});

  void _openDialog(BuildContext context) async {
    final selection = await showDialog<HomeLayout>(
      context: context,
      builder: (context) => _HomeLayoutDialog(selected: stows.homeLayout.value),
    );
    if (selection == null) return;
    stows.homeLayout.value = selection;
  }

  @override
  Widget build(BuildContext context) {
    final homeLayout = useValueListenable(stows.homeLayout);
    return IconButton(
      padding: const .all(4),
      constraints: const BoxConstraints(
        minWidth: kMinInteractiveDimension,
        minHeight: kMinInteractiveDimension,
      ),
      onPressed: () => _openDialog(context),
      icon: homeLayout.icon,
    );
  }
}

class _HomeLayoutDialog extends StatelessWidget {
  const _HomeLayoutDialog({required this.selected});

  final HomeLayout selected;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: .topEnd,
      insetPadding: const .all(8),
      title: Text(t.home.layout.layout),
      content: Column(
        mainAxisSize: .min,
        children: [
          for (final option in HomeLayout.values)
            _HomeLayoutDialogOption(
              homeLayout: option,
              selected: option == selected,
            ),
        ],
      ),
    );
  }
}

class _HomeLayoutDialogOption extends StatelessWidget {
  const _HomeLayoutDialogOption({
    required this.homeLayout,
    required this.selected,
  });

  final HomeLayout homeLayout;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.pop(homeLayout);
      },
      leading: homeLayout.icon,
      title: Text(switch (homeLayout) {
        .masonryGrid => t.home.layout.masonryGrid,
        .simpleGrid => t.home.layout.simpleGrid,
      }),
      trailing: selected ? const Icon(Icons.check) : null,
      selected: selected,
      selectedTileColor: Colors.transparent,
    );
  }
}

enum HomeLayout {
  masonryGrid(fillVertical: false),
  simpleGrid(fillVertical: true);

  const HomeLayout({required this.fillVertical});

  /// Whether the preview card should fill its available vertical space
  final bool fillVertical;

  static const codec = EnumCodec(values);

  Widget get icon => switch (this) {
    .masonryGrid => const Icon(Symbols.browse),
    .simpleGrid => const Icon(Icons.grid_view),
  };
}
