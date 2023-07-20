import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/request.dart';
import '../repository/local_request_repository.dart';

class InsertRequestToLocal
    extends InsertToLocal<Request, LocalRequestRepository> {
  InsertRequestToLocal(super.repository);
}
