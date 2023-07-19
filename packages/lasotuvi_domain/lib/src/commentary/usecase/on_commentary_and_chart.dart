import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../entity/commentary.dart';
import '../entity/commentary_and_chart.dart';

class OnCommentaryAndChart
    extends OnSyncablePairData<Commentary, Chart, CommentaryAndChart> {
  OnCommentaryAndChart({required super.repository})
      : super(
            onCreateItem: (commentary, chart) =>
                CommentaryAndChart(commentary, chart));
}
