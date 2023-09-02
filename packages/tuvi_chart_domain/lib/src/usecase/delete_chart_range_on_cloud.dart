import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_cloud_repository.dart';

class DeleteChartRangeOnCloud
    extends DeleteRangeOnCloud<Chart, ChartCloudRepository> {
  DeleteChartRangeOnCloud({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
