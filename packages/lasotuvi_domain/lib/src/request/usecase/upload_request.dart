import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/request.dart';
import '../repository/request_repository.dart';

class UploadRequest extends Upload<Request, RequestRepository> {
  UploadRequest({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
