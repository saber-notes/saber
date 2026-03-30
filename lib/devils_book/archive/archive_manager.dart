import 'package:flutter/foundation.dart';
import 'archive_models.dart';

/// Manages the archive layer: shelves, tome metadata, bookmarks.
/// Wraps around Saber's file system without replacing it.
class ArchiveManager extends ChangeNotifier {
  static final ArchiveManager _instance = ArchiveManager._internal();
  factory ArchiveManager() => _instance;
  ArchiveManager._internal();

  // Built-in default shelves
  static const Shelf shelfRecent = Shelf(
    id: 'shelf_recent', name: 'Recent', icon: Icons.schedule, sortOrder: -2,
  );
  static const Shelf shelfFavorites = Shelf(
    id: 'shelf_favorites', name: 'Favorites', icon: Icons.star,
    accentColor: Color(0xFFFFAA00), sortOrder: -1,
  );

  final List<Shelf> _shelves = [shelfRecent, shelfFavorites];
  final Map<String, TomeMetadata> _tomes = {};
  final List<PageBookmark> _bookmarks = [];

  List<Shelf> get shelves => List.unmodifiable(_shelves);
  List<PageBookmark> get bookmarks => List.unmodifiable(_bookmarks);

  // --- Shelf Management ---

  void addShelf(Shelf shelf) {
    _shelves.add(shelf);
    notifyListeners();
  }

  void removeShelf(String shelfId) {
    _shelves.removeWhere((s) => s.id == shelfId);
    // Unshelve any tomes on this shelf
    for (final tome in _tomes.values) {
      if (tome.shelfId == shelfId) tome.shelfId = null;
    }
    notifyListeners();
  }

  // --- Tome Metadata ---

  TomeMetadata getOrCreate(String notebookPath) {
    return _tomes.putIfAbsent(notebookPath, () => TomeMetadata(notebookPath: notebookPath));
  }

  void assignToShelf(String notebookPath, String? shelfId) {
    getOrCreate(notebookPath).shelfId = shelfId;
    notifyListeners();
  }

  void toggleFavorite(String notebookPath) {
    final tome = getOrCreate(notebookPath);
    tome.isFavorite = !tome.isFavorite;
    notifyListeners();
  }

  void togglePin(String notebookPath) {
    final tome = getOrCreate(notebookPath);
    tome.isPinned = !tome.isPinned;
    notifyListeners();
  }

  void setSeries(String notebookPath, String? series, {int order = 0}) {
    final tome = getOrCreate(notebookPath);
    tome.series = series;
    tome.seriesOrder = order;
    notifyListeners();
  }

  void addTag(String notebookPath, String tag) {
    final tome = getOrCreate(notebookPath);
    if (!tome.tags.contains(tag)) {
      tome.tags = [...tome.tags, tag];
      notifyListeners();
    }
  }

  void removeTag(String notebookPath, String tag) {
    final tome = getOrCreate(notebookPath);
    tome.tags = tome.tags.where((t) => t != tag).toList();
    notifyListeners();
  }

  /// Get all tomes on a specific shelf, sorted by pin-first then name.
  List<TomeMetadata> tomesOnShelf(String shelfId) {
    final list = _tomes.values.where((t) => t.shelfId == shelfId).toList();
    list.sort((a, b) {
      if (a.isPinned != b.isPinned) return a.isPinned ? -1 : 1;
      return a.notebookPath.compareTo(b.notebookPath);
    });
    return list;
  }

  /// Get all favorited tomes.
  List<TomeMetadata> get favorites =>
      _tomes.values.where((t) => t.isFavorite).toList();

  /// Get all tomes in a named series, sorted by seriesOrder.
  List<TomeMetadata> tomesInSeries(String series) {
    final list = _tomes.values.where((t) => t.series == series).toList();
    list.sort((a, b) => a.seriesOrder.compareTo(b.seriesOrder));
    return list;
  }

  /// Get all unique series names.
  Set<String> get allSeries =>
      _tomes.values.where((t) => t.series != null).map((t) => t.series!).toSet();

  // --- Bookmarks ---

  void addBookmark(PageBookmark bookmark) {
    _bookmarks.add(bookmark);
    notifyListeners();
  }

  void removeBookmark(String notebookPath, int pageIndex) {
    _bookmarks.removeWhere((b) => b.notebookPath == notebookPath && b.pageIndex == pageIndex);
    notifyListeners();
  }

  List<PageBookmark> bookmarksFor(String notebookPath) =>
      _bookmarks.where((b) => b.notebookPath == notebookPath).toList();
}
