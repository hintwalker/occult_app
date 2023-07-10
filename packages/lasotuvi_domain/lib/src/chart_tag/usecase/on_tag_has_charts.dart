import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../../tag/entity/tag.dart';
import '../entity/chart_tag.dart';
import '../entity/tag_has_charts.dart';

class OnTagHasCharts
    extends OnSyncableRightHasLeft<ChartTag, Chart, Tag, TagHasCharts> {
  OnTagHasCharts({required super.repository})
      : super(
            onCreateItem: (chart, tags) =>
                TagHasCharts(source: chart, carry: tags));
}
