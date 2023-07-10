import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class ChartTagModel extends SyncableModel<ChartTag> {
  final int chartId;
  final int tagId;

  ChartTagModel(
    super.id, {
    required this.chartId,
    required this.tagId,
    super.storageState,
    super.syncStatus,
  });

  static ChartTagModel fromMap(Map<String, Object?> map) {
    return ChartTagModel(
      map[columnId] as int,
      chartId: map[ColumnChartTag.chartId] as int,
      tagId: map[ColumnChartTag.tagId] as int,
    );
  }

  static ChartTagModel fromEntity(ChartTag entity) {
    return ChartTagModel(entity.id,
        chartId: entity.chartId,
        tagId: entity.tagId,
        storageState: entity.storageState,
        syncStatus: entity.syncStatus);
  }

  ChartTagModel copyWith({
    int? id,
    int? chartId,
    int? tagId,
    String? storageState,
    String? syncStatus,
  }) {
    return ChartTagModel(
      id ?? this.id,
      chartId: chartId ?? this.chartId,
      tagId: tagId ?? this.tagId,
      storageState: storageState ?? this.storageState,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  ChartTag toEntity() {
    return ChartTag(
      id,
      chartId: chartId,
      tagId: tagId,
      storageState: storageState,
      syncStatus: syncStatus,
    );
  }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnChartTag.chartId: chartId,
      ColumnChartTag.tagId: tagId,
      columnState: storageState,
      columnSyncStatus: syncStatus,
    };
  }

  @override
  Map<String, Object?> toSqlite() {
    final map = dump();
    map.remove(columnSyncStatus);
    map.remove(columnState);
    return map;
  }

  @override
  Map<String, Object?> toCloud() {
    final map = dump();
    map.remove(columnId);
    map.remove(columnSyncStatus);
    return map;
  }

  @override
  String get docId => id.toString();

  @override
  int get primaryKey => id;

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is ChartTagModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
