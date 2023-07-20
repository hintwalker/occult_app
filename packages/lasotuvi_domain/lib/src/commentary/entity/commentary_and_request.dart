import 'package:tauari_data_core/tauari_data_core.dart';

import '../../request/entity/request.dart';
import 'commentary.dart';

class CommentaryAndRequest extends SyncableEntityPair<Commentary, Request> {
  CommentaryAndRequest(super.entity1, super.entity2);
}
