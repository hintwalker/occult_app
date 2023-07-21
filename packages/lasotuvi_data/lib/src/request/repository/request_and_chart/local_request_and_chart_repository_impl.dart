import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/request_model.dart';

class LocalRequestAndChartRepositoryImpl
    extends LocalDependentRepositoryImpl<Request, RequestModel, Chart>
    implements LocalRequestAndChartRepository {
  LocalRequestAndChartRepositoryImpl(
    super.dataSource, {
    required super.ownerRepository,
  }) : super(
          ownerIdColumn: ColumnRequest.chartId,
          entityToModel: (entity) => RequestModel.fromEntity(entity),
        );

  @override
  int getOwnerId(Request entity) => entity.chartId;
}
