import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_cloud_repository.dart';

class DeleteChartFromCloud
    extends DeleteFromCloud<Chart, ChartCloudRepository> {
  DeleteChartFromCloud({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
