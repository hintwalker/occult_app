import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/tag.dart';
import '../repository/tag_repository.dart';

class UpdateTag extends Update<Tag, TagRepository> {
  UpdateTag(super.repository);
}
