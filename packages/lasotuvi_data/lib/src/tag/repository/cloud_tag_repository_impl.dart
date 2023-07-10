import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/tag_model.dart';

class CloudTagRepositoryImpl extends CloudRepositoryImpl<Tag, TagModel>
    implements CloudTagRepository {
  CloudTagRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => TagModel.fromEntity(entity));
}
