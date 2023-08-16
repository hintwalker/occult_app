import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

class CommentaryModel extends MustBuyModel<Commentary> {
  CommentaryModel(
    super.id, {
    required this.title,
    required this.content,
    required this.lastViewed,
    required this.requestId,
    super.storageState,
    super.syncStatus,
    required super.price,
    required super.paid,
    super.modified = LocalLocked.unlocked,
    super.uploadDate,
  });
  final String title;
  final String content;
  final DateTime lastViewed;
  final int requestId;

  @override
  Commentary toEntity() {
    return Commentary(
      id,
      title: title,
      content: content,
      lastViewed: lastViewed,
      requestId: requestId,
      created: DateTime.fromMillisecondsSinceEpoch(id),
      storageState: storageState,
      syncStatus: syncStatus,
      price: price,
      paid: paid,
      modified: modified,
      uploadDate: uploadDate,
    );
  }

  @override
  Map<String, Object?> toCloud() {
    final map = dump();
    map.remove(columnId);
    map.remove(columnSyncStatus);
    return map;
  }

  @override
  Map<String, Object?> toSqlite() {
    final map = dump();
    map.remove(columnState);
    map.remove(columnSyncStatus);
    return map;
  }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnCommentary.title: title,
      ColumnCommentary.content: content,
      ColumnCommentary.requestId: requestId,
      ColumnCommentary.lastViewed: lastViewed.millisecondsSinceEpoch,
      columnState: storageState,
      columnSyncStatus: syncStatus,
      columnPrice: price,
      columnPaid: paid,
      columnModified: modified,
      columnUploadDate: uploadDate?.millisecondsSinceEpoch,
    };
  }

  static CommentaryModel fromMap(Map<String, Object?> map) {
    return CommentaryModel(
      map[columnId] as int,
      title: map[ColumnCommentary.title] as String,
      content: map[ColumnCommentary.content] as String,
      requestId: map[ColumnCommentary.requestId] as int,
      lastViewed: DateTime.fromMillisecondsSinceEpoch(
          map[ColumnCommentary.lastViewed] as int),
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
      price: map[columnPrice] == null ? 0 : map[columnPrice] as int,
      paid: map[columnPaid] == null ? PaidValue.unPaid : map[columnPaid] as int,
      modified: map[columnModified] == null
          ? LocalLocked.unlocked
          : map[columnModified] as int,
      uploadDate: map[columnUploadDate] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(
              map[columnUploadDate] as int,
            ),
    );
  }

  static CommentaryModel fromEntity(Commentary entity) {
    return CommentaryModel(
      entity.id,
      title: entity.title,
      content: entity.content,
      lastViewed: entity.lastViewed,
      requestId: entity.requestId,
      storageState: entity.storageState,
      syncStatus: entity.syncStatus,
      price: entity.price,
      paid: entity.paid,
      modified: entity.modified,
      uploadDate: entity.uploadDate,
    );
  }

  @override
  String get docId => id.toString();

  @override
  int get primaryKey => id;

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is CommentaryModel &&
          other.id == id;

  @override
  int get hashCode => id.hashCode;
}
