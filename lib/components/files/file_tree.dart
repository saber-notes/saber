

import 'package:flutter/material.dart';


Map<String, dynamic> dummyStructure = {
  "CompSci": {
    "Operating Systems Long title even longer": {
      "OS 1": null,
      "OS 2": null,
      "OS 3": null,
    },
    "Data Structures": {
      "DS 1": null,
      "DS 2": null,
      "DS 3": null,
    },
  },
  "Maths": {
    "Algebra": {
      "Math Algebra 1": null,
      "Math Algebra 2": null,
      "Math Algebra 3": null,
    },
    "Geometry": {
      "Geometry 1": null,
      "Geometry 2": null,
      "Geometry 3": null,
    },
    "Maths overview": null,
  },
  "Personal": {
    "Personal 1": null,
    "Personal 2": null,
    "Personal 3": null,
  },
};

class FileTree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < dummyStructure.length; i++)
              FileTreeBranch(
                label: dummyStructure.keys.elementAt(i),
                children: dummyStructure[dummyStructure.keys.elementAt(i)],
              )
          ]
        ),
      ),
    );
  }

}

class FileTreeBranch extends StatefulWidget {
  FileTreeBranch({
    Key? key,
    required this.label,
    required this.children,
  }) : super(key: key) {
    isFile = children == null;
  }

  final String label;
  final Map<String, dynamic>? children;
  late final bool isFile;

  @override
  _FileTreeBranchState createState() => _FileTreeBranchState();

}

class _FileTreeBranchState extends State<FileTreeBranch> {
  bool areChildrenVisible = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          color: colorScheme.surface,
          child: InkWell(
            onTap: () {
              setState(() {
                areChildrenVisible = !areChildrenVisible;
              });
            },
            child: Row(
              children: [
                if (widget.isFile) ...[
                  const Icon(Icons.insert_drive_file, size: 25),
                ] else ...[ // folder
                  Icon(areChildrenVisible ? Icons.folder_open: Icons.folder, color: colorScheme.primary, size: 25),
                ],

                const SizedBox(width: 5),
                Text(
                  widget.label,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),


        if (areChildrenVisible && !widget.isFile) Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < widget.children!.length; i++)
                FileTreeBranch(
                  label: widget.children!.keys.elementAt(i),
                  children: widget.children![widget.children!.keys.elementAt(i)],
                )
            ],
          ),
        ),

      ],
    );
  }

}
