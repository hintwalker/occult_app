import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/request_model.dart';

class ReqChartRepositoryImpl
    extends SyncableDependentRepositoryImpl<Request, RequestModel, Chart>
    implements RequestAndChartRepository {
  ReqChartRepositoryImpl(
      {required super.localDependentRepository,
      required super.cloudDependentRepository,
      required super.ownerRepository});
}
