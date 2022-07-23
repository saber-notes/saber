
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridFolders extends StatelessWidget {
  const GridFolders({
    Key? key,
    required this.folders,
    this.physics = const AlwaysScrollableScrollPhysics(),
  }) : super(key: key);

  final List<String> folders;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      return AlignedGridView.count(
        itemCount: folders.length,
        crossAxisCount: constraints.maxWidth ~/ 150 + 1,
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: physics,
        itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  Text("Folder $index"),
                  const SizedBox(height: 10),
                  Text("This is example folder $index"),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}