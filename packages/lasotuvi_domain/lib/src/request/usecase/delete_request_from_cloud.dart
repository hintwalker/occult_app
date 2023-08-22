import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/request.dart';
import '../repository/cloud_request_repository.dart';

class DeleteRequestFromCloud
    extends DeleteFromCloud<Request, CloudRequestRepository> {
  DeleteRequestFromCloud({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
