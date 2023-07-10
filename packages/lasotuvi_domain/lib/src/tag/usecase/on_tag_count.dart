import 'package:tauari_data_core/tauari_data_core.dart';

import '../repository/tag_repository.dart';

class OnTagCount extends OnCountEveryWhere<TagRepository> {
  const OnTagCount(super.repository);
}
