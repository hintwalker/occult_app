import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/tag_model.dart';

class LocalTagRepositoryImpl extends LocalRepositoryImpl<Tag, TagModel>
    implements LocalTagRepository {
  LocalTagRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => TagModel.fromEntity(entity));
}
