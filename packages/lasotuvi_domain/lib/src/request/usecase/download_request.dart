import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/request.dart';
import '../repository/request_repository.dart';

class DownloadRequest extends Download<Request, RequestRepository> {
  DownloadRequest(super.repository);
}
