import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tuvi_request/src/domain/request.dart';

import '../domain/column_request.dart';

class RequestModel extends SyncableModel<Request> {
  final int chartId;
  final String content;

  RequestModel(
    super.id, {
    required super.modified,
    required this.chartId,
    required this.content,
    super.storageState,
    super.syncStatus,
    super.uploadDate,
  });
  @override
  String get docId => id.toString();

  @override
  Map<String, Object?> dump() => {
        columnId: id,
        columnSyncStatus: syncStatus,
        columnState: storageState,
        columnUploadDate: uploadDate,
        columnModified: modified,
        ColumnRequest.chartId: chartId,
        ColumnRequest.content: content,
      };

  @override
  int get primaryKey => id;

  @override
  Map<String, Object?> toCloud() {
    final map = dump();
    map.remove(columnSyncStatus);
    map.remove(columnId);
    return map;
  }

  @override
  Request toEntity() => Request(
        id,
        modified: modified,
        chartId: chartId,
        content: content,
        storageState: storageState,
        syncStatus: syncStatus,
        uploadDate: uploadDate,
      );

  @override
  Map<String, Object?> toSqlite() {
    final map = dump();
    map.remove(columnSyncStatus);
    map.remove(columnState);
    return map;
  }

  RequestModel copyWith({
    int? chartId,
    String? syncStatus,
    DateTime? uploadDate,
    int? modified,
    String? content,
    String? storageState,
  }) =>
      RequestModel(
        id,
        modified: modified ?? this.modified,
        chartId: chartId ?? this.chartId,
        content: content ?? this.content,
        syncStatus: syncStatus ?? this.syncStatus,
        uploadDate: uploadDate ?? this.uploadDate,
        storageState: storageState ?? this.storageState,
      );
}
