import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_repository.dart';

class DownloadChart extends Download<Chart, ChartRepository> {
  DownloadChart(super.repository);
}
