
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:saber/i18n/strings.g.dart';

class GridFolders extends StatelessWidget {
  const GridFolders({
    super.key,
    required this.isAtRoot,
    required this.folders,
    required this.onTap,
  });

  final bool isAtRoot;
  final List<String> folders;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    int indexOffset = isAtRoot ? 0 : 1;
    return SliverAlignedGrid.count(
      itemCount: folders.length + indexOffset,
      crossAxisCount: mediaQuery.size.width ~/ 150 + 1,
      mainAxisSpacing: 10,
      itemBuilder: (context, index) {
        bool isBackFolder = index < indexOffset;
        return Card(
          child: InkWell(
            onTap: () {
              onTap(isBackFolder ? '..' : folders[index - indexOffset]);
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isBackFolder) const Icon(Icons.folder_open, size: 50)
                  else const Icon(Icons.folder, size: 50),

                  const SizedBox(height: 8),

                  Text(isBackFolder ? t.home.backFolder : folders[index - indexOffset]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
