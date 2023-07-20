import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/request_model.dart';

class LocalRequestRepositoryImpl
    extends LocalRepositoryImpl<Request, RequestModel>
    implements LocalRequestRepository {
  LocalRequestRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => RequestModel.fromEntity(entity));
}
