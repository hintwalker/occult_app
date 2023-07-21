import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/request_model.dart';

class CloudRequestRepositoryImpl
    extends CloudDependentRepositoryImpl<Request, RequestModel, Chart>
    implements CloudRequestRepository {
  CloudRequestRepositoryImpl(super.dataSource,
      {required super.ownerIdColumn,
      required super.ownerRepository,
      required super.entityToModel});

  @override
  int getOwnerId(Request entity) => entity.chartId;
}
