import 'package:tauari_data_core/tauari_data_core.dart';

import '../../request/entity/request.dart';
import '../entity/commentary.dart';
import '../entity/commentary_and_request.dart';

class OnCommentaryAndRequest
    extends OnSyncablePairData<Commentary, Request, CommentaryAndRequest> {
  OnCommentaryAndRequest({required super.repository})
      : super(
            onCreateItem: (commentary, request) =>
                CommentaryAndRequest(commentary, request));
}
