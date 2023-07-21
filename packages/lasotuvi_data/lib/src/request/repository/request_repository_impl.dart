import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/request_model.dart';

class RequestRepositoryImpl
    extends SyncableDependentRepositoryImpl<Request, RequestModel, Chart>
    implements RequestRepository {
  RequestRepositoryImpl({
    required super.localDependentRepository,
    required super.cloudDependentRepository,
    required super.ownerRepository,
  });
}
