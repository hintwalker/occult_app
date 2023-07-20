import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

class RequestModel extends SyncableModel<Request> {
  final String name;
  final int gender;
  final int birthday;
  final int watchingYear;
  final int timeZoneOffset;
  final int lastViewed;
  final String? avatar;
  final int solved;

  RequestModel(
    super.id, {
    required this.name,
    required this.gender,
    required this.birthday,
    required this.watchingYear,
    this.timeZoneOffset = 7,
    required this.lastViewed,
    this.avatar,
    super.storageState,
    super.syncStatus,
    required this.solved,
  });

  @override
  Request toEntity() {
    return Request(
      id,
      name: name,
      avatar: avatar,
      gender: Gender.fromInt(gender),
      birthday: DateTime.fromMillisecondsSinceEpoch(birthday),
      watchingYear: watchingYear,
      timeZoneOffset: timeZoneOffset,
      created: DateTime.fromMillisecondsSinceEpoch(id),
      lastViewed: DateTime.fromMillisecondsSinceEpoch(lastViewed),
      syncStatus: syncStatus,
      storageState: storageState,
      solved: solved,
    );
  }

  static RequestModel fromEntity(Request entity) {
    return RequestModel(
      entity.id,
      name: entity.name,
      gender: entity.gender.intValue,
      birthday: entity.birthday.millisecondsSinceEpoch,
      watchingYear: entity.watchingYear,
      timeZoneOffset: entity.timeZoneOffset,
      lastViewed: entity.lastViewed.millisecondsSinceEpoch,
      avatar: entity.avatar,
      storageState: entity.storageState,
      syncStatus: entity.syncStatus,
      solved: entity.solved,
    );
  }

  RequestModel copyWith({
    int? id,
    String? name,
    int? gender,
    int? birthday,
    int? watchingYear,
    int? timeZoneOffset,
    int? lastViewed,
    String? avatar,
    String? storageState,
    String? syncStatus,
    int? solved,
  }) {
    return RequestModel(
      id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      watchingYear: watchingYear ?? this.watchingYear,
      timeZoneOffset: timeZoneOffset ?? this.timeZoneOffset,
      lastViewed: lastViewed ?? this.lastViewed,
      avatar: avatar ?? this.avatar,
      storageState: storageState ?? this.storageState,
      syncStatus: syncStatus ?? this.syncStatus,
      solved: solved ?? this.solved,
    );
  }

  static RequestModel fromMap(Map<String, Object?> map) {
    return RequestModel(
      map[columnId] as int,
      name: map[ColumnRequest.name] == null
          ? ''
          : map[ColumnRequest.name] as String,
      gender: map[ColumnRequest.gender] == null
          ? 0
          : map[ColumnRequest.gender] as int,
      birthday: map[ColumnRequest.birthday] == null
          ? DateTime(1990, 1, 1, 0, 1).millisecondsSinceEpoch
          : map[ColumnRequest.birthday] as int,
      watchingYear: map[ColumnRequest.watchingYear] == null
          ? 2023
          : map[ColumnRequest.watchingYear] as int,
      timeZoneOffset: map[ColumnRequest.timeZoneOffset] == null
          ? 7
          : map[ColumnRequest.timeZoneOffset] as int,
      lastViewed: map[ColumnRequest.lastViewed] == null
          ? DateTime.now().millisecond
          : map[ColumnRequest.lastViewed] as int,
      avatar: map[ColumnRequest.avatar] == null
          ? null
          : map[ColumnRequest.avatar] as String,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
      solved: map[ColumnRequest.solved] == null
          ? RequestSolved.unSolved
          : map[ColumnRequest.solved] as int,
    );
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is RequestModel && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnRequest.name: name,
      ColumnRequest.gender: gender,
      ColumnRequest.birthday: birthday,
      ColumnRequest.watchingYear: watchingYear,
      ColumnRequest.timeZoneOffset: timeZoneOffset,
      ColumnRequest.lastViewed: lastViewed,
      ColumnRequest.avatar: avatar,
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
