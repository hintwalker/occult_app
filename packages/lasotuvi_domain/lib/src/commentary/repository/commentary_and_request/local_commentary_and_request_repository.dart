import 'package:tauari_data_core/tauari_data_core.dart';

import '../../../request/entity/request.dart';
import '../../entity/commentary.dart';

abstract class LocalCommentaryAndRequestRepository
    extends LocalDependentRepository<Commentary, Request> {}
