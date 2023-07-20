import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/request.dart';

abstract class RequestRepository extends SyncableRepository<Request> {
  RequestRepository(
      {required super.localRepository, required super.cloudRepository});
}
