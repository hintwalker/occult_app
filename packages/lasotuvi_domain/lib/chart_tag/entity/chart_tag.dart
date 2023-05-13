part of lasotuvi_domain;

class ChartTag extends SyncableEntity<ChartTag> {
  ChartTag(
    super.id, {
    required this.chartId,
    required this.tagId,
    super.syncStatus,
    super.storageState,
  });
  final int chartId;
  final int tagId;

  factory ChartTag.fromMap(Map<String, Object?> map) {
    return ChartTag(
      map[columnId] as int,
      chartId: map[ColumnChartTag.chartId] as int,
      tagId: map[ColumnChartTag.tagId] as int,
      syncStatus:
          map[columnOnCloud] == null ? null : map[columnOnCloud] as String,
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
    );
  }

  static ChartTag fromIds(int id, int chartId, int tagId) {
    return ChartTag(
      id,
      chartId: chartId,
      tagId: tagId,
    );
  }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnChartTag.chartId: chartId,
      ColumnChartTag.tagId: tagId,
      columnOnCloud: syncStatus,
      columnState: storageState
    };
  }

  ChartTag copyWith({
    int? id,
    int? chartId,
    int? tagId,
    String? syncStatus,
    String? storageState,
  }) {
    return ChartTag(
      id ?? this.id,
      chartId: chartId ?? this.chartId,
      tagId: tagId ?? this.tagId,
      syncStatus: syncStatus ?? this.syncStatus,
      storageState: storageState ?? this.storageState,
    );
  }

  @override
  ChartTag copyWithOnCloud(String? value) {
    return copyWith(syncStatus: value);
  }

  @override
  ChartTag copyWithState(String? state) {
    return copyWith(storageState: state);
  }
}
