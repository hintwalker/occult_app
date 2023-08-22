import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import '../../tag/entity/tag.dart';
import '../entity/chart_tag.dart';

class ConnectChartsToTag extends ConnectLeftToRight<ChartTag, Chart, Tag> {
  ConnectChartsToTag({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
