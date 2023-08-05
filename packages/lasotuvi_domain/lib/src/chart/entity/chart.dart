import 'package:sunoom/sunoom.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../../old_version_data/structure/old_chart_columns.dart';
import '../column_chart.dart';

class Chart extends SyncableEntity<Chart> {
  Chart(super.id,
      {required this.name,
      required this.gender,
      required this.birthday,
      required this.watchingYear,
      required this.timeZoneOffset,
      required this.created,
      required this.lastViewed,
      required super.modified,
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
    final now = DateTime.now();
    return Chart(now.millisecondsSinceEpoch,
        name: '',
        gender: Gender.female,
        birthday: now,
        watchingYear: 2023,
        timeZoneOffset: 7,
        created: now,
        lastViewed: now,
        modified: now.millisecondsSinceEpoch);
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
      columnSyncStatus: getSyncStatus,
      columnState: state,
      columnModified: modified,
    };
  }

  static Chart fromMap(Map<String, Object?> map) {
    return Chart(map[columnId] as int,
        name: map[ColumnChart.name] == null
            ? ''
            : map[ColumnChart.name] as String,
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
        syncStatus: map[columnSyncStatus] == null
            ? null
            : map[columnSyncStatus] as String,
        storageState:
            map[columnState] == null ? null : map[columnState] as String,
        modified: map[columnModified] == null
            ? LocalLocked.unlocked
            : map[columnModified] as int);
  }

  static Chart fromOldVersion(Map<String, Object?> map) {
    return Chart(
      map[OldChartColumns.createdDate] as int,
      name: map[OldChartColumns.name] == null
          ? ''
          : map[OldChartColumns.name] as String,
      gender: map[OldChartColumns.gender] == null
          ? Gender.female
          : Gender.fromInt(map[OldChartColumns.gender] as int),
      watchingYear: map[OldChartColumns.watchingYear] == null
          ? 2023
          : map[OldChartColumns.watchingYear] as int,
      timeZoneOffset: 7,
      avatar: _getOldAvatar(map[OldChartColumns.avatar]),
      birthday: DateTime(
          map[OldChartColumns.yearGreg] as int,
          map[OldChartColumns.monthGreg] as int,
          map[OldChartColumns.dayGreg] as int,
          map[OldChartColumns.hour] as int,
          map[OldChartColumns.minute] as int),
      created: DateTime.fromMillisecondsSinceEpoch(
          map[OldChartColumns.createdDate] as int),
      lastViewed: map[OldChartColumns.lastOpened] == null
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(
              map[OldChartColumns.lastOpened] as int),
      syncStatus: null,
      storageState: null,
      modified: LocalLocked.unlocked,
    );
  }

  static String? _getOldAvatar(Object? oldAvatar) {
    if (oldAvatar == null) {
      return null;
    }
    final string = oldAvatar as String;
    if (string.length < 10) {
      return null;
    } else {
      return string.substring(7);
    }
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
    int? modified,
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
      modified: modified ?? this.modified,
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
  copyWithSyncStatus(String? value) {
    return copyWith(syncStatus: value);
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType && other is Chart && other.id == id;
  // &&
  // other.avatar == avatar &&
  // other.birthday.compareTo(birthday) == 0 &&
  // other.gender == gender &&
  // other.name == name &&
  // other.timeZoneOffset == timeZoneOffset &&
  // other.watchingYear == watchingYear;

  @override
  int get hashCode => Object.hashAll([
        id,
        // avatar,
        // birthday,
        // gender,
        // name,
        // timeZoneOffset,
        // watchingYear,
      ]);

  @override
  Chart copyWithState(String? state) {
    return copyWith(storageState: state);
  }

  @override
  Chart copyWithModified(int value) => copyWith(modified: value);
}
