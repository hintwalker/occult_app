import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/local_chart_repository.dart';

class InsertManyChartsToLocal
    extends InsertManyToLocal<Chart, LocalChartRepository> {
  InsertManyChartsToLocal(super.repository);
}
