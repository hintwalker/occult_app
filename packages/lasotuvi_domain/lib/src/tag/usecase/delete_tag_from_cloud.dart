import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/tag.dart';
import '../repository/cloud_tag_repository.dart';

class DeleteTagFromCloud extends DeleteFromCloud<Tag, CloudTagRepository> {
  DeleteTagFromCloud(super.repository);
}
