import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/tag.dart';
import '../repository/local_tag_repository.dart';

class InsertTagToLocal extends InsertToLocal<Tag, LocalTagRepository> {
  InsertTagToLocal(super.repository);
}
