import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

import '../../old_version_data/structure/old_tag_columns.dart';
import '../column_tag.dart';

class Tag extends SyncableEntity<Tag> {
  Tag(
    super.id, {
    required this.title,
    required this.subTitle,
    required this.created,
    super.syncStatus,
    super.storageState,
    required super.modified,
    super.uploadDate,
  });
  final String title;
  final String subTitle;
  final DateTime created;

  factory Tag.fromMap(Map<String, Object?> map) {
    return Tag(
      map[columnId] as int,
      title: map[ColumnTag.title] == null ? '' : map[ColumnTag.title] as String,
      subTitle: map[ColumnTag.description] == null
          ? ''
          : map[ColumnTag.description] as String,
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
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

  static Tag fromOldVersion(Map<String, Object?> map) {
    return Tag(
      map[OldTagColumns.tagId] as int,
      title: map[OldTagColumns.name] == null
          ? ''
          : map[OldTagColumns.name] as String,
      subTitle: map[OldTagColumns.description] == null
          ? ''
          : map[OldTagColumns.description] as String,
      created:
          DateTime.fromMillisecondsSinceEpoch(map[OldTagColumns.tagId] as int),
      storageState: null,
      syncStatus: null,
      modified: LocalLocked.unlocked,
      uploadDate: null,
    );
  }

  @override
  bool operator ==(Object? other) {
    final result = identical(other, this) ||
        other.runtimeType == runtimeType && other is Tag && other.id == id;
    // &&
    // other.syncStatus == syncStatus;
    return result;
  }

  @override
  int get hashCode => id.hashCode;

  // Map<String, Object?> toCloud() {
  //   final map = toMap();
  //   map.remove(columnId);
  //   map.remove(columnOnCloud);
  //   return map;
  // }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnTag.title: title,
      ColumnTag.description: subTitle,
      columnCreated: created.millisecondsSinceEpoch,
      columnState: state,
      columnSyncStatus: getSyncStatus,
      columnModified: modified,
      columnUploadDate: uploadDate?.millisecondsSinceEpoch,
    };
  }

  @override
  Tag copyWithSyncStatus(String? value) {
    return copyWith(syncStatus: value);
  }

  Tag copyWith({
    int? id,
    String? title,
    String? subTitle,
    DateTime? created,
    String? syncStatus,
    String? storageState,
    int? modified,
    DateTime? uploadDate,
  }) {
    return Tag(
      id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      created: created ?? this.created,
      syncStatus: syncStatus ?? this.syncStatus,
      storageState: storageState ?? this.storageState,
      modified: modified ?? this.modified,
      uploadDate: uploadDate ?? this.uploadDate,
    );
  }

  @override
  Tag copyWithState(String? state) => copyWith(storageState: state);

  @override
  Tag copyWithModified(int value) => copyWith(modified: value);

  @override
  Tag copyWithUploadDate(DateTime? value) => copyWith(uploadDate: value);
}
