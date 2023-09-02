import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_local_repository.dart';

class InsertManyChartsToLocal
    extends InsertManyToLocal<Chart, ChartLocalRepository> {
  InsertManyChartsToLocal(super.repository);
}
