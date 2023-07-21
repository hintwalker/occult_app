import 'package:sunoom/sunoom.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../../chart/entity/chart.dart';
import '../column_request.dart';

class Request extends SyncableEntity<Request> {
  Request(
    super.id, {
    required this.name,
    required this.gender,
    required this.birthday,
    required this.watchingYear,
    required this.timeZoneOffset,
    required this.created,
    required this.lastViewed,
    required this.solved,
    required this.chartId,
    super.storageState,
    this.avatar,
    super.syncStatus,
  });
  final String name;
  final Gender gender;
  final DateTime birthday;
  final int watchingYear;
  final int timeZoneOffset;
  final DateTime created;
  final DateTime lastViewed;
  final String? avatar;
  final int solved;
  final int chartId;

  // static Request empty() {
  //   return Request(
  //     DateTime.now().millisecondsSinceEpoch,
  //     name: '',
  //     gender: Gender.female,
  //     birthday: DateTime.now(),
  //     watchingYear: 2023,
  //     timeZoneOffset: 7,
  //     created: DateTime.now(),
  //     lastViewed: DateTime.now(),
  //     solved: 0,
  //     chartId: 0,
  //   );
  // }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id.toString(),
      ColumnRequest.name: name,
      ColumnRequest.gender: gender,
      ColumnRequest.birthday: birthday.millisecondsSinceEpoch,
      ColumnRequest.watchingYear: watchingYear,
      ColumnRequest.timeZoneOffset: timeZoneOffset,
      columnCreated: created.millisecondsSinceEpoch,
      ColumnRequest.lastViewed: lastViewed.millisecondsSinceEpoch,
      ColumnRequest.avatar: avatar,
      columnSyncStatus: getSyncStatus,
      columnState: state,
      ColumnRequest.solved: solved,
    };
  }

  static Request fromMap(Map<String, Object?> map) {
    return Request(
      map[columnId] as int,
      name: map[ColumnRequest.name] == null
          ? ''
          : map[ColumnRequest.name] as String,
      gender: map[ColumnRequest.gender] == null
          ? Gender.female
          : Gender.fromInt(map[ColumnRequest.gender] as int),
      watchingYear: map[ColumnRequest.watchingYear] == null
          ? 2023
          : map[ColumnRequest.watchingYear] as int,
      timeZoneOffset: map[ColumnRequest.timeZoneOffset] == null
          ? 7
          : map[ColumnRequest.timeZoneOffset] as int,
      avatar: map[ColumnRequest.avatar] == null
          ? null
          : map[ColumnRequest.avatar] as String,
      birthday: map[ColumnRequest.birthday] == null
          ? DateTime(1990, 1, 1, 0, 1)
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnRequest.birthday] as int),
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      lastViewed: map[ColumnRequest.lastViewed] == null
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnRequest.lastViewed] as int),
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      solved: map[ColumnRequest.solved] == null
          ? RequestSolved.unSolved
          : map[ColumnRequest.solved] as int,
      chartId: map[ColumnRequest.chartId] == null
          ? 0
          : map[ColumnRequest.chartId] as int,
    );
  }

  static Request fromChart(Chart chart) {
    final newId = DateTime.now();
    return Request(
      newId.millisecondsSinceEpoch,
      name: chart.name,
      gender: chart.gender,
      birthday: chart.birthday,
      watchingYear: chart.watchingYear,
      timeZoneOffset: chart.timeZoneOffset,
      lastViewed: chart.lastViewed,
      avatar: chart.avatar,
      storageState: chart.storageState,
      syncStatus: chart.syncStatus,
      solved: RequestSolved.unSolved,
      chartId: chart.id,
      created: newId,
    );
  }

  Request copyWith({
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
    int? solved,
    int? chartId,
  }) {
    return Request(
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
      solved: solved ?? this.solved,
      chartId: chartId ?? this.chartId,
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
      other.runtimeType == runtimeType && other is Request && other.id == id;

  @override
  int get hashCode => id.hashCode;

  @override
  Request copyWithState(String? state) {
    return copyWith(storageState: state);
  }
}
