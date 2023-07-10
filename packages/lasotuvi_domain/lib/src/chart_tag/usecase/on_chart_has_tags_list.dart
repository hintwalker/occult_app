import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../../tag/entity/tag.dart';
import '../entity/chart_has_tags.dart';
import '../entity/chart_tag.dart';

class OnChartHasTagsList
    extends OnSyncableLeftHasRightList<ChartTag, Chart, Tag, ChartHasTags> {
  OnChartHasTagsList({required super.repository})
      : super(
            onCreateItem: (chart, tags) =>
                ChartHasTags(source: chart, carry: tags));
}
