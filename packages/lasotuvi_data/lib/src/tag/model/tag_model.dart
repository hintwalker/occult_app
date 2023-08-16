import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

class TagModel extends SyncableModel<Tag> {
  TagModel(
    super.id, {
    required this.title,
    required this.subTitle,
    super.storageState,
    super.syncStatus,
    super.modified = LocalLocked.unlocked,
    super.uploadDate,
  });
  final String title;
  final String subTitle;

  @override
  Tag toEntity() {
    return Tag(
      id,
      title: title,
      subTitle: subTitle,
      created: DateTime.fromMillisecondsSinceEpoch(id),
      storageState: storageState,
      syncStatus: syncStatus,
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
      ColumnTag.title: title,
      ColumnTag.description: subTitle,
      columnState: storageState,
      columnSyncStatus: syncStatus,
      columnModified: modified,
      columnUploadDate: uploadDate?.millisecondsSinceEpoch,
      // columnCreated: created.millisecondsSinceEpoch
    };
  }

  static TagModel fromMap(Map<String, Object?> map) {
    return TagModel(
      map[columnId] as int,
      title: map[ColumnTag.title] as String,
      subTitle: map[ColumnTag.description] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
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

  static TagModel fromEntity(Tag entity) {
    return TagModel(
      entity.id,
      title: entity.title,
      subTitle: entity.subTitle,
      storageState: entity.storageState,
      syncStatus: entity.syncStatus,
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
      other.runtimeType == runtimeType && other is TagModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
