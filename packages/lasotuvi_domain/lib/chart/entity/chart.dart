part of lasotuvi_domain;

class Chart extends SyncableEntity<Chart> {
  Chart(super.id,
      {required this.name,
      required this.gender,
      required this.birthday,
      required this.watchingYear,
      required this.timeZoneOffset,
      required this.created,
      required this.lastViewed,
      super.storageState,
      this.avatar,
      super.syncStatus});
  final String name;
  final Gender gender;
  final DateTime birthday;
  final int watchingYear;
  final int timeZoneOffset;
  final DateTime created;
  final DateTime lastViewed;
  final String? avatar;
  static Chart empty() {
    return Chart(DateTime.now().millisecondsSinceEpoch,
        name: '',
        gender: Gender.female,
        birthday: DateTime.now(),
        watchingYear: 2023,
        timeZoneOffset: 7,
        created: DateTime.now(),
        lastViewed: DateTime.now());
  }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id.toString(),
      ColumnChart.name: name,
      ColumnChart.gender: gender,
      ColumnChart.birthday: birthday.millisecondsSinceEpoch,
      ColumnChart.watchingYear: watchingYear,
      ColumnChart.timeZoneOffset: timeZoneOffset,
      columnCreated: created.millisecondsSinceEpoch,
      ColumnChart.lastViewed: lastViewed.millisecondsSinceEpoch,
      ColumnChart.avatar: avatar,
      columnOnCloud: onCloud,
      columnState: state,
    };
  }

  static Chart fromMap(Map<String, Object?> map) {
    return Chart(
      map[columnId] as int,
      name:
          map[ColumnChart.name] == null ? '' : map[ColumnChart.name] as String,
      gender: map[ColumnChart.gender] == null
          ? Gender.female
          : Gender.fromInt(map[ColumnChart.gender] as int),
      watchingYear: map[ColumnChart.watchingYear] == null
          ? 2023
          : map[ColumnChart.watchingYear] as int,
      timeZoneOffset: map[ColumnChart.timeZoneOffset] == null
          ? 7
          : map[ColumnChart.timeZoneOffset] as int,
      avatar: map[ColumnChart.avatar] == null
          ? null
          : map[ColumnChart.avatar] as String,
      birthday: map[ColumnChart.birthday] == null
          ? DateTime(1990, 1, 1, 0, 1)
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnChart.birthday] as int),
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      lastViewed: map[ColumnChart.lastViewed] == null
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnChart.lastViewed] as int),
      syncStatus:
          map[columnOnCloud] == null ? null : map[columnOnCloud] as String,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
    );
  }

  Chart copyWith({
    int? id,
    String? name,
    Gender? gender,
    DateTime? birthday,
    int? watchingYear,
    int? timeZoneOffset,
    DateTime? created,
    DateTime? lastViewed,
    String? avatar,
    String? syncStatus,
    String? storageState,
  }) {
    return Chart(
      id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
      watchingYear: watchingYear ?? this.watchingYear,
      timeZoneOffset: timeZoneOffset ?? this.timeZoneOffset,
      created: created ?? this.created,
      lastViewed: lastViewed ?? this.lastViewed,
      avatar: avatar ?? this.avatar,
      syncStatus: syncStatus ?? this.syncStatus,
      storageState: storageState ?? this.storageState,
    );
  }

  HumanBio toHumanBio() {
    final moment = birthday.toMoment(TimeZone(offsetInHour: timeZoneOffset));
    return HumanBio(
        name: name,
        birthDay: moment,
        watchingYear: watchingYear,
        gender: gender);
  }

  @override
  copyWithOnCloud(String? value) {
    return copyWith(syncStatus: value);
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is Chart && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  Chart copyWithState(String? state) {
    return copyWith(storageState: state);
  }
}
