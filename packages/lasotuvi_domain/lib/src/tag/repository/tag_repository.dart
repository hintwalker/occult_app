import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/tag.dart';

abstract class TagRepository extends SyncableRepository<Tag> {
  TagRepository(
      {required super.localRepository, required super.cloudRepository});
}
