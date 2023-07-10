import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/tag.dart';
import '../repository/tag_repository.dart';

class UploadTag extends Upload<Tag, TagRepository> {
  UploadTag(super.repository);
}
