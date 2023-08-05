import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/tag.dart';
import '../repository/local_tag_repository.dart';

class InsertManyTagsToLocal extends InsertManyToLocal<Tag, LocalTagRepository> {
  InsertManyTagsToLocal(super.repository);
}
