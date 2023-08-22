import 'package:tauari_data_core/tauari_data_core.dart';

import 'column_subscription.dart';
import 'subscription_status.dart';

class Subscription implements CloudGetable, Dumpable {
  Subscription({
    required this.id,
    required this.planId,
    required this.beginDate,
    required this.expiredDate,
    required this.timeZoneOffset,
    required this.total,
    required this.energy,
    required this.status,
  });
  final int id;
  final DateTime beginDate;
  final DateTime expiredDate;
  final Duration timeZoneOffset;
  final String planId;
  final int total;
  final int energy;
  final String status;

  static Duration getTimeZone(int hours) => Duration(hours: hours);

  static int timeZoneToMapValue(Duration zone) => zone.inHours;

  factory Subscription.free() {
    final begin = DateTime(2023, 1, 1);
    return Subscription(
        id: 0,
        planId: '0',
        beginDate: begin,
        expiredDate: DateTime(2025, 12, 31),
        timeZoneOffset: const Duration(hours: 7),
        total: 0,
        energy: 0,
        status: SubscriptionStatus.actived);
  }

  factory Subscription.fromMap(Map<String, Object?> map) {
    return Subscription(
      id: map[columnId] as int,
      planId: map[ColumnSubscription.planId] as String,
      beginDate: map[ColumnSubscription.begin] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnSubscription.begin] as int),
      expiredDate: DateTime.fromMillisecondsSinceEpoch(
          map[ColumnSubscription.expired] as int),
      timeZoneOffset:
          getTimeZone(map[ColumnSubscription.timeZoneOffset] as int),
      total: map[ColumnSubscription.total] as int,
      energy: map[ColumnSubscription.energy] as int,
      status: map[ColumnSubscription.status] as String,
    );
  }

  Subscription copyWith({
    int? id,
    DateTime? beginDate,
    DateTime? expiredDate,
    Duration? timeZoneOffset,
    String? planId,
    int? total,
    int? energy,
    String? status,
  }) {
    return Subscription(
      id: id ?? this.id,
      planId: planId ?? this.planId,
      beginDate: beginDate ?? this.beginDate,
      expiredDate: expiredDate ?? this.expiredDate,
      timeZoneOffset: timeZoneOffset ?? this.timeZoneOffset,
      total: total ?? this.total,
      energy: energy ?? this.energy,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnSubscription.begin: beginDate.millisecondsSinceEpoch,
      ColumnSubscription.expired: expiredDate.millisecondsSinceEpoch,
      ColumnSubscription.timeZoneOffset: timeZoneToMapValue(timeZoneOffset),
      ColumnSubscription.planId: planId,
      ColumnSubscription.total: total,
      ColumnSubscription.energy: energy,
      ColumnSubscription.status: status,
    };
  }

  // @override
  // Map<String, Object?> toCloud() {
  //   final map = dump();
  //   map.remove(columnId);
  //   return map;
  // }

  @override
  String get docId => id.toString();

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other is Subscription &&
          other.runtimeType == runtimeType &&
          other.id == id &&
          other.expiredDate == expiredDate;

  @override
  int get hashCode => Object.hash(id, expiredDate);

  Subscription extendExpiredDate(Duration duration) {
    return copyWith(expiredDate: DateTime.now().add(duration));
  }

  Subscription addToTotal(int value) {
    return copyWith(total: total + value);
  }
}
