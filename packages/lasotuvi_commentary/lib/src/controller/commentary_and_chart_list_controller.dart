import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class CommentaryAndChartListController
    extends SyncablePairDataListStreamController<Commentary, Chart,
        CommentaryAndChart> {
  CommentaryAndChartListController({required OnCommentaryAndChart onData})
      : super(onSyncableData: onData);
}
