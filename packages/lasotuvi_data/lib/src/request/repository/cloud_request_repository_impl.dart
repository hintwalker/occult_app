import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/request_model.dart';

class CloudRequestRepositoryImpl
    extends CloudRepositoryImpl<Request, RequestModel>
    implements CloudRequestRepository {
  CloudRequestRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => RequestModel.fromEntity(entity));
}
