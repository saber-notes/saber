import 'dart:async';

import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saber/components/home/export_note_button.dart';
import 'package:saber/components/home/grid_folders.dart';
import 'package:saber/components/home/masonry_files.dart';
import 'package:saber/components/home/move_note_button.dart';
import 'package:saber/components/home/new_note_button.dart';
import 'package:saber/components/home/no_files.dart';
import 'package:saber/components/home/rename_note_button.dart';
import 'package:saber/components/home/syncing_button.dart';
import 'package:saber/data/file_manager/file_manager.dart';
import 'package:saber/data/routes.dart';
import 'package:saber/i18n/strings.g.dart';
import 'package:saber/pages/editor/editor.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({
    super.key,
    String? path,
  }) : initialPath = path;//初始化路徑 initialPath，用於設定初始顯示的路徑

  final String? initialPath;

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  DirectoryChildren? children;

  final List<String?> pathHistory = [];//追踪用戶的瀏覽歷史，以便可以實現後退功能
  String? path;

  final ValueNotifier<List<String>> selectedFiles = ValueNotifier([]);

  @override
  void initState() {
    path = widget.initialPath;

    findChildrenOfPath();
    fileWriteSubscription =
        FileManager.fileWriteStream.stream.listen(fileWriteListener);//data/file_manager/file_manager.dart獲取、創建、刪除、重命名文件夾和文件,以實時更新頁面上顯示的內容
    selectedFiles.addListener(_setState);

    super.initState();
  }

  @override
  void dispose() {
    selectedFiles.removeListener(_setState);
    fileWriteSubscription?.cancel();
    super.dispose();
  }

  StreamSubscription? fileWriteSubscription;
  void fileWriteListener(FileOperation event) {
    if (!event.filePath.startsWith(path ?? '/')) return;
    findChildrenOfPath(fromFileListener: true);
  }

  void _setState() => setState(() {});

  Future findChildrenOfPath({bool fromFileListener = false}) async {
    if (!mounted) return;

    if (fromFileListener) {
      // don't refresh if we're not on the home page
      final location = GoRouterState.of(context).uri.toString();
      if (!location.startsWith(RoutePaths.prefixOfHome)) return;
    }

    children = await FileManager.getChildrenOfDirectory(path ?? '/');

    if (mounted) setState(() {});
  }

  void onDirectoryTap(String folder) {//處理用戶點擊文件夾的事件，更新當前路徑並導航到該文件夾
    selectedFiles.value = [];
    if (folder == '..') {
      path = pathHistory.isEmpty ? null : pathHistory.removeLast();
    } else {
      pathHistory.add(path);//追踪用戶的瀏覽歷史，以便可以實現後退功能
      path = "${path ?? ''}/$folder";
    }
    context.go(HomeRoutes.browseFilePath(path ?? '/'));
    findChildrenOfPath();
  }

  Future<void> createFolder(String folderName) async {
    final folderPath = '${path ?? ''}/$folderName';//如果 path 為 null，則使用空字符串替代,folderName 添加到當前路徑的末尾，斜杠 (/) 作為路徑分隔符
    await FileManager.createFolder(folderPath);//data/file_manager/file_manager.dart
    //文件系統中實際創建文件夾。由於這個過程可能涉及文件 I/O 操作，因此使用 await 來等待操作完成，這樣可以防止函數在文件夾實際創建完成前繼續執行。
    findChildrenOfPath();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final platform = Theme.of(context).platform;
    final cupertino =
        platform == TargetPlatform.iOS || platform == TargetPlatform.macOS;

    String title = t.home.titles.browse;
    if (path?.isNotEmpty ?? false) {
      title += ': $path';
    }

    final crossAxisCount = MediaQuery.sizeOf(context).width ~/ 300 + 1;

    return Scaffold(
      body: RefreshIndicator(//RefreshIndicator 來允許下拉刷新操作
        onRefresh: () => Future.wait([
          findChildrenOfPath(),
          Future.delayed(const Duration(milliseconds: 500)),
        ]),
        child: CustomScrollView(//CustomScrollView 包含 SliverAppBar 和其他 slivers（如 GridFolders 和 MasonryFiles）來顯示文件夾和文件
          slivers: [//高度可自定義的滾動效果的特殊類型的小部件（如列表、網格）
            SliverPadding(
              padding: const EdgeInsets.only(
                bottom: 8,
              ),
              sliver: SliverAppBar(//"瀏覽"的那個bar
                collapsedHeight: kToolbarHeight,
                expandedHeight: 200,
                pinned: true,//SliverAppBar 會在滾動時固定在頂部，只有其內容會根據滾動進行展開或折疊
                scrolledUnderElevation: 1,//其他內容滾動到 SliverAppBar 下方時的陰影大小(立體感)  其時好像就bar的顏色深淺
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    title,
                    style: TextStyle(color: colorScheme.onBackground),
                  ),
                  centerTitle: cupertino,
                  titlePadding: EdgeInsetsDirectional.only(
                      start: cupertino ? 0 : 16, bottom: 16),
                ),
                actions: const [
                  SyncingButton(),//components/home/syncing_button.dart  右上角那個圖示,好像沒用?
                ],
              ),
            ),
            GridFolders(//GridFolders 網格視圖中展示文件夾列表,用於顯示文件夾列表，並提供創建、重命名和刪除文件夾的功能
              isAtRoot: path?.isEmpty ?? true,//path 為空，則認為是在根目錄
              crossAxisCount: crossAxisCount,//網格中每行的列數。這個值通常會根據屏幕寬度或裝置類型動態計算
              onTap: onDirectoryTap,//上面有定義(80行)
              createFolder: createFolder,//上面有定義(92行)
              doesFolderExist: (String folderName) {
                return children?.directories.contains(folderName) ?? false;//data/file_manager/file_manager.dart
              },
              renameFolder: (String oldName, String newName) async {
                final oldPath = '${path ?? ''}/$oldName';
                await FileManager.renameDirectory(oldPath, newName);//data/file_manager/file_manager.dart
                findChildrenOfPath();
              },
              isFolderEmpty: (String folderName) async {
                final folderPath = '${path ?? ''}/$folderName';
                final children =
                    await FileManager.getChildrenOfDirectory(folderPath);//data/file_manager/file_manager.dart,刪除文件夾前確認是否有內容需要先處理
                return children?.isEmpty ?? true;
              },
              deleteFolder: (String folderName) async {
                final folderPath = '${path ?? ''}/$folderName';
                await FileManager.deleteDirectory(folderPath);//data/file_manager/file_manager.dart
                findChildrenOfPath();
              },
              folders: [//一個列表，包含了當前路徑下所有的文件夾
                for (String directoryPath in children?.directories ?? const [])//data/file_manager/file_manager.dart
                  directoryPath,
              ],
            ),
            if (children == null) ...[//children 為 null 時，代表正在加載數據
              // loading 這裡可以顯示加載指示器（例如，一個旋轉的進度條），但實際代碼中只有註釋。
            ] else if (children!.isEmpty) ...[
              const SliverSafeArea(//確保內容在安全區域內顯示，避免被設備的特定界面元素（如蘋果的刘海或安卓的按鍵）遮擋
                sliver: SliverToBoxAdapter(
                  child: NoFiles(),//components/home/no_files.dart
                ),
              ),
            ] else ...[
              SliverSafeArea(
                minimum: const EdgeInsets.only(
                  // Allow space for the FloatingActionButton
                  bottom: 70,
                ),
                sliver: MasonryFiles(//MasonryFiles 用於顯示文件列表，並允許選擇多個文件進行操作，如移動、重命名或刪除。components/home/masonry_files.dart
                  crossAxisCount: crossAxisCount,
                  files: [
                    for (String filePath in children?.files ?? const [])
                      "${path ?? ""}/$filePath",
                  ],
                  selectedFiles: selectedFiles,
                ),
              ),
            ],
          ],//sliver
        ),
      ),
      floatingActionButton: NewNoteButton(//提供創建新筆記的快捷方式,右下角??components/home/new_note_button.dart
        cupertino: cupertino,
        path: path,
      ),
      persistentFooterButtons: selectedFiles.value.isEmpty//沒長按 就不顯示
          ? null//發現小bug
          : [
              Collapsible(
                  axis: CollapsibleAxis.vertical,
                  collapsed: selectedFiles.value.length != 1,
                  child: RenameNoteButton(//components/home/rename_note_button.dart
                    existingPath: selectedFiles.value.isEmpty
                        ? ''
                        : selectedFiles.value.first,
                    unselectNotes: () => selectedFiles.value = [],
                  )),
              MoveNoteButton(//components/home/move_note_button.dart移動(檔案才行)
                filesToMove: selectedFiles.value,
                unselectNotes: () => selectedFiles.value = [],
              ),
              IconButton(
                padding: EdgeInsets.zero,
                tooltip: t.home.deleteNote,
                onPressed: () async {
                  await Future.wait([
                    for (String filePath in selectedFiles.value)
                      FileManager.doesFileExist(
                              filePath + Editor.extensionOldJson)
                          .then((oldExtension) => FileManager.deleteFile(//data/file_manager/file_manager.dart
                              filePath +
                                  (oldExtension
                                      ? Editor.extensionOldJson
                                      : Editor.extension))),
                  ]);
                  selectedFiles.value = [];
                },
                icon: const Icon(Icons.delete_forever),
              ),
              ExportNoteButton(//導出選中的文件(檔案才行)
                selectedFiles: selectedFiles.value,
              ),
            ],
    );
  }
}
