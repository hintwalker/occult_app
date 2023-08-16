import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

class ChartTagModel extends SyncableModel<ChartTag> {
  final int chartId;
  final int tagId;

  ChartTagModel(
    super.id, {
    required this.chartId,
    required this.tagId,
    super.storageState,
    super.syncStatus,
    required super.modified,
    super.uploadDate,
  });

  static ChartTagModel fromMap(Map<String, Object?> map) {
    return ChartTagModel(
      map[columnId] as int,
      chartId: map[ColumnChartTag.chartId] as int,
      tagId: map[ColumnChartTag.tagId] as int,
      modified: map[columnModified] == null
          ? LocalLocked.unlocked
          : map[columnModified] as int,
      uploadDate: map[columnUploadDate] == null
          ? null
          : DateTime.fromMillisecondsSinceEpoch(
              map[columnUploadDate] as int,
            ),
    );
  }

  static ChartTagModel fromEntity(ChartTag entity) {
    return ChartTagModel(
      entity.id,
      chartId: entity.chartId,
      tagId: entity.tagId,
      storageState: entity.storageState,
      syncStatus: entity.syncStatus,
      modified: entity.modified,
      uploadDate: entity.uploadDate,
    );
  }

  ChartTagModel copyWith({
    int? id,
    int? chartId,
    int? tagId,
    String? storageState,
    String? syncStatus,
    int? modified,
    DateTime? uploadDate,
  }) {
    return ChartTagModel(
      id ?? this.id,
      chartId: chartId ?? this.chartId,
      tagId: tagId ?? this.tagId,
      storageState: storageState ?? this.storageState,
      syncStatus: syncStatus ?? this.syncStatus,
      modified: modified ?? this.modified,
      uploadDate: uploadDate ?? this.uploadDate,
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
      modified: modified,
      uploadDate: uploadDate,
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
      columnModified: modified,
      columnUploadDate: uploadDate?.millisecondsSinceEpoch,
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
      other.runtimeType == runtimeType &&
          other is ChartTagModel &&
          other.id == id;

  @override
  int get hashCode => id.hashCode;
}
