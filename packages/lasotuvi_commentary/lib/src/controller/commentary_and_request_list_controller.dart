import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class CommentaryAndRequestListController
    extends SyncablePairDataListStreamController<Commentary, Request,
        CommentaryAndRequest> {
  CommentaryAndRequestListController({required OnCommentaryAndRequest onData})
      : super(onSyncableData: onData);
}
