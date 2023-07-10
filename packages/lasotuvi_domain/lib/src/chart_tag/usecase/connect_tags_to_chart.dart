import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../../tag/entity/tag.dart';
import '../entity/chart_tag.dart';

class ConnectTagsToChart extends ConnectRightToLeft<ChartTag, Chart, Tag> {
  ConnectTagsToChart(super.repository);
}
