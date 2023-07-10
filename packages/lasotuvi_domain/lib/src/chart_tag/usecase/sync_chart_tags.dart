import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart_tag.dart';
import '../repository/chart_tag_repository.dart';

class SyncChartTags extends SyncData<ChartTag, ChartTagRepository> {
  SyncChartTags(super.repository);
}
