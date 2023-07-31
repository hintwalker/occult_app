import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/column_subscription.dart';
import '../entity/subscription.dart';

class SubscriptionModel implements CloudModel<Subscription> {
  SubscriptionModel({
    required this.id,
    required this.packageId,
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
  final String packageId;
  final int total;
  final int energy;
  final String status;

  factory SubscriptionModel.fromMap(Map<String, Object?> map) {
    return SubscriptionModel(
      id: map[columnId] as int,
      packageId: map[ColumnSubscription.planId] as String,
      beginDate: map[ColumnSubscription.begin] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnSubscription.begin] as int),
      expiredDate: DateTime.fromMillisecondsSinceEpoch(
          map[ColumnSubscription.expired] as int),
      timeZoneOffset: Subscription.getTimeZone(
          map[ColumnSubscription.timeZoneOffset] as int),
      total: map[ColumnSubscription.total] as int,
      energy: map[ColumnSubscription.energy] as int,
      status: map[ColumnSubscription.status] as String,
    );
  }

  factory SubscriptionModel.fromEntity(Subscription entity) {
    return SubscriptionModel(
      id: entity.id,
      packageId: entity.planId,
      beginDate: entity.beginDate,
      expiredDate: entity.expiredDate,
      timeZoneOffset: entity.timeZoneOffset,
      total: entity.total,
      energy: entity.energy,
      status: entity.status,
    );
  }

  @override
  Subscription toEntity() {
    return Subscription(
      id: id,
      planId: packageId,
      beginDate: beginDate,
      expiredDate: expiredDate,
      timeZoneOffset: timeZoneOffset,
      total: total,
      energy: energy,
      status: status,
    );
  }

  SubscriptionModel copyWith({
    int? id,
    DateTime? beginDate,
    DateTime? expiredDate,
    Duration? timeZoneOffset,
    String? packageId,
    int? total,
    int? energy,
    String? status,
  }) {
    return SubscriptionModel(
      id: id ?? this.id,
      packageId: packageId ?? this.packageId,
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
      ColumnSubscription.timeZoneOffset:
          Subscription.timeZoneToMapValue(timeZoneOffset),
      ColumnSubscription.planId: packageId,
      ColumnSubscription.total: total,
      ColumnSubscription.energy: energy,
      ColumnSubscription.status: status,
    };
  }

  @override
  String get docId => id.toString();

  @override
  Map<String, Object?> toCloud() {
    final map = dump();
    map.remove(columnId);
    return map;
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other is SubscriptionModel &&
          other.runtimeType == runtimeType &&
          other.id == id &&
          other.expiredDate == expiredDate;

  @override
  int get hashCode => Object.hash(id, expiredDate);
}
