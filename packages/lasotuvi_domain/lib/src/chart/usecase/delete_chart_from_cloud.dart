import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/cloud_chart_repository.dart';

class DeleteChartFromCloud
    extends DeleteFromCloud<Chart, CloudChartRepository> {
  DeleteChartFromCloud(super.repository);
}
