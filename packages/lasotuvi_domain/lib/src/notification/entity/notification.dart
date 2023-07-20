import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

import '../column_notification.dart';

class Notification extends SyncableEntity<Notification> {
  Notification(
    super.id, {
    required this.title,
    required this.content,
    required this.url,
    required this.type,
    required this.created,
    required this.seen,
    super.storageState,
    super.syncStatus,
  });
  final String title;
  final String content;
  final String type;
  final String url;
  final DateTime created;
  final int seen;

  // static Notification empty() {
  //   return Notification(DateTime.now().millisecondsSinceEpoch,
  //       name: '',
  //       gender: Gender.female,
  //       birthday: DateTime.now(),
  //       watchingYear: 2023,
  //       timeZoneOffset: 7,
  //       created: DateTime.now(),
  //       lastViewed: DateTime.now());
  // }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id.toString(),
      ColumnNotification.title: title,
      ColumnNotification.content: content,
      ColumnNotification.url: url,
      ColumnNotification.type: type,
      ColumnNotification.seen: seen,
      columnCreated: created.millisecondsSinceEpoch,
      columnSyncStatus: getSyncStatus,
      columnState: state,
    };
  }

  static Notification fromMap(Map<String, Object?> map) {
    return Notification(
      map[columnId] as int,
      title: map[ColumnNotification.title] == null
          ? ''
          : map[ColumnNotification.title] as String,
      content: map[ColumnNotification.content] == null
          ? ''
          : map[ColumnNotification.content] as String,
      type: map[ColumnNotification.type] == null
          ? NotificationType.info
          : map[ColumnNotification.type] as String,
      url: map[ColumnNotification.url] == null
          ? ''
          : map[ColumnNotification.url] as String,
      seen: map[ColumnNotification.seen] == null
          ? SeenValue.unseen
          : map[ColumnNotification.seen] as int,
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
    );
  }

  Notification copyWith({
    int? id,
    String? title,
    String? content,
    String? type,
    String? url,
    int? seen,
    DateTime? created,
    String? syncStatus,
    String? storageState,
  }) {
    return Notification(
      id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      type: type ?? this.type,
      url: url ?? this.url,
      seen: seen ?? this.seen,
      created: created ?? this.created,
      syncStatus: syncStatus ?? this.syncStatus,
      storageState: storageState ?? this.storageState,
    );
  }

  @override
  copyWithSyncStatus(String? value) {
    return copyWith(syncStatus: value);
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is Notification &&
          other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  Notification copyWithState(String? state) {
    return copyWith(storageState: state);
  }
}
