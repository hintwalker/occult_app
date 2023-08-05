import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

import '../../old_version_data/structure/old_chart_tag_columns.dart';
import '../column_chart_tag.dart';

class ChartTag extends SyncableEntity<ChartTag> {
  ChartTag(
    super.id, {
    required this.chartId,
    required this.tagId,
    super.syncStatus,
    super.storageState,
    super.modified = LocalLocked.unlocked,
  });
  final int chartId;
  final int tagId;

  factory ChartTag.fromMap(Map<String, Object?> map) {
    return ChartTag(map[columnId] as int,
        chartId: map[ColumnChartTag.chartId] as int,
        tagId: map[ColumnChartTag.tagId] as int,
        syncStatus: map[columnSyncStatus] == null
            ? null
            : map[columnSyncStatus] as String,
        storageState:
            map[columnState] == null ? null : map[columnState] as String,
        modified: map[columnModified] == null
            ? LocalLocked.unlocked
            : map[columnModified] as int);
  }

  static ChartTag fromOldVersion(int id, Map<String, Object?> map) {
    return ChartTag(id,
        chartId: map[OldChartTagColumns.humanId] as int,
        tagId: map[OldChartTagColumns.tagId] as int,
        syncStatus: null,
        storageState: null,
        modified: LocalLocked.unlocked);
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
      columnSyncStatus: syncStatus,
      columnState: storageState,
      columnModified: modified,
    };
  }

  ChartTag copyWith({
    int? id,
    int? chartId,
    int? tagId,
    String? syncStatus,
    String? storageState,
    int? modified,
  }) {
    return ChartTag(
      id ?? this.id,
      chartId: chartId ?? this.chartId,
      tagId: tagId ?? this.tagId,
      syncStatus: syncStatus ?? this.syncStatus,
      storageState: storageState ?? this.storageState,
      modified: modified ?? this.modified,
    );
  }

  @override
  ChartTag copyWithSyncStatus(String? value) {
    return copyWith(syncStatus: value);
  }

  @override
  ChartTag copyWithState(String? state) {
    return copyWith(storageState: state);
  }

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType &&
          other is ChartTag &&
          other.chartId == chartId &&
          other.tagId == tagId &&
          other.id == id;

  @override
  int get hashCode => Object.hashAll([
        id,
        chartId,
        tagId,
      ]);

  @override
  ChartTag copyWithModified(int value) => copyWith(modified: value);

  @override
  int get getModified => modified;
}
