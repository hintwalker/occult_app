import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/commentary.dart';

abstract class CommentaryRepository extends SyncableRepository<Commentary> {
  CommentaryRepository(
      {required super.localRepository, required super.cloudRepository});
}
