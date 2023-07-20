import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/request_model.dart';

class RequestRepositoryImpl
    extends SyncableRepositoryImpl<Request, RequestModel>
    implements RequestRepository {
  RequestRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });
}
