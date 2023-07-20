import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/request.dart';
import '../repository/request_repository.dart';

class SyncRequests extends SyncData<Request, RequestRepository> {
  SyncRequests(super.repository);
}
