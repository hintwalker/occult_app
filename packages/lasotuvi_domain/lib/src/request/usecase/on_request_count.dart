import 'package:tauari_data_core/tauari_data_core.dart';

import '../repository/request_repository.dart';

class OnRequestCount extends OnCountEveryWhere<RequestRepository> {
  const OnRequestCount(super.repository);
}
