import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/tag_model.dart';

class TagRepositoryImpl extends SyncableRepositoryImpl<Tag, TagModel>
    implements TagRepository {
  TagRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });
}
