import 'package:tauari_data_core/tauari_data_core.dart';

import '../../request/entity/request.dart';
import '../entity/commentary.dart';

class OnCommentaryByRequestId extends OnDependedByOwnerId<Commentary, Request> {
  OnCommentaryByRequestId(super.repository);
}
