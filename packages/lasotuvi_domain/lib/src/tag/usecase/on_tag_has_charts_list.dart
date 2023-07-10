import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../../chart_tag/entity/chart_tag.dart';
import '../../chart_tag/entity/tag_has_charts.dart';
import '../entity/tag.dart';

class OnTagHasChartsList
    extends OnSyncableRightHasLeftList<ChartTag, Chart, Tag, TagHasCharts> {
  OnTagHasChartsList({required super.repository})
      : super(
            onCreateItem: (tag, charts) =>
                TagHasCharts(source: tag, carry: charts));
}
