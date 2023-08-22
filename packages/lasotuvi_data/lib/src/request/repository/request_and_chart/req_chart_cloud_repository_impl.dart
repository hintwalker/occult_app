import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/request_model.dart';

class ReqChartCloudRepositoryImpl
    extends CloudDependentRepositoryImpl<Request, RequestModel, Chart>
    implements CloudRequestAndChartRepository {
  ReqChartCloudRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnRequest.chartId,
          entityToModel: (entity) => RequestModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Request entity) => entity.chartId;
}
