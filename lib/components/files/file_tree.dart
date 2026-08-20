import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';

class const FileTree({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: .directional(start: 12, top: 12, bottom: 12),
        child: _FileTreeDir(path: null),
      ),
    );
  }
}

class const _FileTreeDir({required final String? path}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final areChildrenVisible = useState(path == null);
    final streamSnapshot = useStream(
      FileManager.fileWriteStream.stream,
      preserveState: true,
    );
    final refreshFuture = useMemoized(() async {
      final children = await FileManager.getChildrenOfDirectory(path ?? '/');
      if (children != null) areChildrenVisible.value |= children.onlyOneChild();
      return children;
    }, [streamSnapshot.data]);
    final children = useFuture(refreshFuture, preserveState: true).data;

    final colorScheme = ColorScheme.of(context);
    return Column(
      crossAxisAlignment: .start,
      children: [
        if (path != null)
          InkWell(
            borderRadius: const .all(.circular(8)),
            onTap: () => areChildrenVisible.value = !areChildrenVisible.value,
            child: Row(
              children: [
                Icon(
                  areChildrenVisible.value ? Icons.folder_open : Icons.folder,
                  color: colorScheme.primary,
                  size: 25,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    path!.substring(path!.lastIndexOf('/') + 1),
                    style: TextTheme.of(context).bodyMedium
                        ?.copyWith(fontSize: 14),
                    overflow: .ellipsis,
                  ),
                ),
              ],
            ),
          ),
        if (areChildrenVisible.value && children != null)
          Stack(
            children: [
              if (path != null)
                Positioned.directional(
                  top: 8,
                  bottom: 8,
                  start: 0,
                  textDirection: Directionality.of(context),
                  child: const VerticalDivider(width: 24),
                ),
              Padding(
                padding: path != null ? const .directional(start: 24) : .zero,
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    for (var i = 0; i < children.directories.length; i++)
                      _FileTreeDir(
                        path: "${path ?? ""}/${children.directories[i]}",
                      ),
                    for (var i = 0; i < children.files.length; i++)
                      _FileTreeFile(path: "${path ?? ""}/${children.files[i]}"),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class const _FileTreeFile({required final String path}) extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        InkWell(
          borderRadius: const .all(.circular(8)),
          onTap: () {
            context.push(RoutePaths.editFilePath(path));
          },
          child: Row(
            children: [
              const Icon(Icons.insert_drive_file, size: 25),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  path.substring(path.lastIndexOf('/') + 1),
                  style: TextTheme.of(context).bodyMedium
                      ?.copyWith(fontSize: 14),
                  overflow: .ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
