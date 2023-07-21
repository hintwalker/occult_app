import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

class NotificationModel extends SyncableModel<TuviNotification> {
  final String title;
  final String content;
  final String type;
  final String url;
  final int seen;

  NotificationModel(
    super.id, {
    required this.title,
    required this.content,
    required this.type,
    required this.url,
    required this.seen,
    super.storageState,
    super.syncStatus,
  });

  @override
  TuviNotification toEntity() {
    return TuviNotification(
      id,
      title: title,
      content: content,
      type: type,
      url: url,
      seen: seen,
      created: DateTime.fromMillisecondsSinceEpoch(id),
      syncStatus: syncStatus,
      storageState: storageState,
    );
  }

  static NotificationModel fromEntity(TuviNotification entity) {
    return NotificationModel(
      entity.id,
      title: entity.title,
      content: entity.content,
      type: entity.type,
      url: entity.url,
      seen: entity.seen,
      storageState: entity.storageState,
      syncStatus: entity.syncStatus,
    );
  }

  NotificationModel copyWith({
    int? id,
    String? title,
    String? content,
    String? type,
    String? url,
    int? seen,
    String? storageState,
    String? syncStatus,
  }) {
    return NotificationModel(
      id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      url: url ?? this.url,
      seen: seen ?? this.seen,
      storageState: storageState ?? this.storageState,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  static NotificationModel fromMap(Map<String, Object?> map) {
    return NotificationModel(
      map[columnId] as int,
      title: map[ColumnNotification.title] == null
          ? ''
          : map[ColumnNotification.title] as String,
      content: map[ColumnNotification.content] == null
          ? ''
          : map[ColumnNotification.content] as String,
      type: map[ColumnNotification.type] == null
          ? ''
          : map[ColumnNotification.type] as String,
      url: map[ColumnNotification.url] == null
          ? ''
          : map[ColumnNotification.url] as String,
      seen: map[ColumnNotification.seen] == null
          ? SeenValue.unseen
          : map[ColumnNotification.seen] as int,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
    );
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is NotificationModel && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnNotification.title: title,
      ColumnNotification.content: content,
      ColumnNotification.type: type,
      ColumnNotification.url: url,
      ColumnNotification.seen: seen,
      columnState: storageState,
      columnSyncStatus: syncStatus,
    };
  }

  @override
  String get docId => id.toString();

  @override
  int get primaryKey => id;

  @override
  Map<String, Object?> toSqlite() {
    final map = dump();
    map.remove(columnState);
    map.remove(columnSyncStatus);
    return map;
  }

  @override
  Map<String, Object?> toCloud() {
    final result = dump();
    result.remove(columnId);
    result.remove(columnSyncStatus);
    return result;
  }
}
