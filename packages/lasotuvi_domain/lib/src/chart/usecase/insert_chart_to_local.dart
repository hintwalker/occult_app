import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/local_chart_repository.dart';

class InsertChartToLocal extends InsertToLocal<Chart, LocalChartRepository> {
  InsertChartToLocal(super.repository);
}
