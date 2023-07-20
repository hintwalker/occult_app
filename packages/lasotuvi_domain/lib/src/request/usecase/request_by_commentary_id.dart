import 'package:tauari_data_core/tauari_data_core.dart';

import '../../commentary/entity/commentary.dart';
import '../entity/request.dart';

class RequestByCommentaryId extends OwnerByDependentId<Commentary, Request> {
  RequestByCommentaryId(super.repository);
}
