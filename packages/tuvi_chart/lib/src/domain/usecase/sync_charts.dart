import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_repository.dart';

class SyncCharts extends SyncData<Chart, ChartRepository> {
  SyncCharts(super.repository);
}
