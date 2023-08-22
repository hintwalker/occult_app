import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_local_repository.dart';

class DeleteChartFromLocal
    extends DeleteFromLocal<Chart, ChartLocalRepository> {
  DeleteChartFromLocal(super.repository);
}
