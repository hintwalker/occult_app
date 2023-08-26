import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tuvi_request/src/domain/column_request.dart';

class Request extends SyncableEntity<Request> {
  Request(
    super.id, {
    required super.modified,
    required this.chartId,
    required this.content,
    super.syncStatus,
    super.storageState,
    super.uploadDate,
  });

  final int chartId;
  final String content;

  Request copyWith({
    int? chartId,
    String? syncStatus,
    DateTime? uploadDate,
    int? modified,
    String? content,
    String? storageState,
  }) =>
      Request(
        id,
        modified: modified ?? this.modified,
        chartId: chartId ?? this.chartId,
        content: content ?? this.content,
        syncStatus: syncStatus ?? this.syncStatus,
        uploadDate: uploadDate ?? this.uploadDate,
        storageState: storageState ?? this.storageState,
      );

  @override
  copyWithModified(int value) => copyWith(modified: value);

  @override
  copyWithState(String? state) => copyWith();

  @override
  copyWithSyncStatus(String? value) => copyWith(syncStatus: value);

  @override
  copyWithUploadDate(DateTime? value) => copyWith(uploadDate: value);

  @override
  Map<String, Object?> dump() => {
        columnId: id,
        columnSyncStatus: syncStatus,
        columnUploadDate: uploadDate,
        columnState: storageState,
        columnModified: modified,
        ColumnRequest.chartId: chartId,
        ColumnRequest.content: content,
      };
}
