part of lasotuvi_data;

class ChartModel extends SyncableModel<Chart> {
  final String name;
  final int gender;
  final int birthday;
  final int watchingYear;
  final int timeZoneOffset;
  final int lastViewed;
  final String? avatar;

  ChartModel(
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
  });

  @override
  Chart toEntity() {
    return Chart(
      id,
      name: name,
      gender: Gender.fromInt(gender),
      birthday: DateTime.fromMillisecondsSinceEpoch(birthday),
      watchingYear: watchingYear,
      timeZoneOffset: timeZoneOffset,
      created: DateTime.fromMillisecondsSinceEpoch(id),
      lastViewed: DateTime.fromMillisecondsSinceEpoch(lastViewed),
      syncStatus: syncStatus,
      storageState: storageState,
    );
  }

  static ChartModel fromEntity(Chart entity) {
    return ChartModel(
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
    );
  }

  ChartModel copyWith({
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
  }) {
    return ChartModel(
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
    );
  }

  static ChartModel fromMap(Map<String, Object?> map) {
    return ChartModel(
      map[columnId] as int,
      name:
          map[ColumnChart.name] == null ? '' : map[ColumnChart.name] as String,
      gender:
          map[ColumnChart.gender] == null ? 0 : map[ColumnChart.gender] as int,
      birthday: map[ColumnChart.birthday] == null
          ? DateTime(1990, 1, 1, 0, 1).millisecondsSinceEpoch
          : map[ColumnChart.birthday] as int,
      watchingYear: map[ColumnChart.watchingYear] == null
          ? 2023
          : map[ColumnChart.watchingYear] as int,
      timeZoneOffset: map[ColumnChart.timeZoneOffset] == null
          ? 7
          : map[ColumnChart.timeZoneOffset] as int,
      lastViewed: map[ColumnChart.lastViewed] == null
          ? DateTime.now().millisecond
          : map[ColumnChart.lastViewed] as int,
      avatar: map[ColumnChart.avatar] == null
          ? null
          : map[ColumnChart.avatar] as String,
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
      other is ChartModel && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnChart.name: name,
      ColumnChart.gender: gender,
      ColumnChart.birthday: birthday,
      ColumnChart.watchingYear: watchingYear,
      ColumnChart.timeZoneOffset: timeZoneOffset,
      ColumnChart.lastViewed: lastViewed,
      ColumnChart.avatar: avatar,
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
    final result = toSqlite();
    result.remove(columnId);
    result.remove(columnSyncStatus);
    return result;
  }
}
