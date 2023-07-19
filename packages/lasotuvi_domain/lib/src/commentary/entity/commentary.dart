import 'package:tauari_data_core/tauari_data_core.dart';

import '../column_commentary.dart';

class Commentary extends MustBuyEntity<Commentary> {
  Commentary(
    super.id, {
    required this.title,
    required this.content,
    required this.created,
    required this.lastViewed,
    required this.chartId,
    super.storageState,
    super.syncStatus,
    required super.price,
    required super.paid,
  });
  final String title;
  final String content;
  final DateTime created;
  final DateTime lastViewed;
  final int chartId;

  @override
  Commentary copyWithState(String? state) => copyWith(storageState: state);

  @override
  Commentary copyWithSyncStatus(String? value) => copyWith(syncStatus: value);

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnCommentary.title: title,
      ColumnCommentary.content: content,
      columnCreated: created.millisecondsSinceEpoch,
      ColumnCommentary.lastViewed: lastViewed.millisecondsSinceEpoch,
      ColumnCommentary.chartId: chartId,
      columnState: storageState,
      columnSyncStatus: syncStatus,
      columnPrice: price,
      columnPaid: paid,
    };
  }

  factory Commentary.fromMap(Map<String, dynamic> map) {
    return Commentary(
      map[columnId] as int,
      title: map[ColumnCommentary.title] == null
          ? ''
          : map[ColumnCommentary.title] as String,
      content: map[ColumnCommentary.content] as String,
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      lastViewed: map[ColumnCommentary.lastViewed] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(
              map[ColumnCommentary.lastViewed] as int),
      chartId: map[ColumnCommentary.chartId] as int,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus: map[columnSyncStatus] == null
          ? null
          : map[columnSyncStatus] as String,
      price: map[columnPrice] == null ? 0 : map[columnPrice] as int,
      paid: map[columnPaid] == null ? PaidValue.unPaid : map[columnPaid] as int,
    );
  }

  Commentary copyWith({
    int? id,
    String? title,
    String? content,
    DateTime? created,
    DateTime? lastViewed,
    String? syncStatus,
    int? chartId,
    String? storageState,
    int? price,
    int? paid,
  }) {
    return Commentary(
      id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      created: created ?? this.created,
      lastViewed: lastViewed ?? this.lastViewed,
      chartId: chartId ?? this.chartId,
      storageState: storageState ?? this.storageState,
      syncStatus: syncStatus ?? this.syncStatus,
      price: price ?? this.price,
      paid: paid ?? this.paid,
    );
  }

  @override
  Commentary copyWithPaid(int value) => copyWith(paid: value);

  @override
  Commentary copyWithPrice(int value) => copyWith(price: value);

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType && other is Commentary && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
