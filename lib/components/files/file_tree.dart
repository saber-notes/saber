

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/file_manager.dart';
import 'package:saber/data/routes.dart';


class FileTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FileTreeBranch(
          path: null,
        )
      ),
    );
  }

}

class FileTreeBranch extends StatefulWidget {
  const FileTreeBranch({
    Key? key,
    required this.path,
  }) : super(key: key);

  final String? path;

  @override
  State<FileTreeBranch> createState() => _FileTreeBranchState();

}

class _FileTreeBranchState extends State<FileTreeBranch> {
  List<String>? children;
  bool? isDirectory;
  bool areChildrenVisible = false;

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  _getInfo() async {
    isDirectory = widget.path == null ? true : await FileManager.isDirectory(widget.path!);
    children = await FileManager.getChildrenOfDirectory(widget.path ?? "/");
    areChildrenVisible = children != null && (children!.length <= 1);
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.path != null) Material(
          color: colorScheme.surface,
          child: InkWell(
            onTap: () {
              setState(() {
                if (isDirectory ?? true) {
                  areChildrenVisible = !areChildrenVisible;
                } else {
                  context.push("${RoutePaths.edit}?path=${widget.path}");
                }
              });
            },
            child: Row(
              children: [
                if (isDirectory == null) ...[
                  const SizedBox(width: 25, height: 25),
                ] else if (isDirectory!) ...[
                  Icon(areChildrenVisible ? Icons.folder_open: Icons.folder, color: colorScheme.primary, size: 25),
                ] else ...[
                  const Icon(Icons.insert_drive_file, size: 25),
                ],

                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.path!.substring(widget.path!.lastIndexOf("/") + 1),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),


        if (areChildrenVisible && children != null) Padding(
          padding: (widget.path != null) ? const EdgeInsets.only(left: 25) : const EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < children!.length; i++)
                FileTreeBranch(
                  path: "${widget.path ?? ""}/${children![i]}",
                )
            ],
          ),
        ),

      ],
    );
  }

}
