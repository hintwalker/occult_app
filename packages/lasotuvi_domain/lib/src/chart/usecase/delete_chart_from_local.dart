import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/local_chart_repository.dart';

class DeleteChartFromLocal
    extends DeleteFromLocal<Chart, LocalChartRepository> {
  DeleteChartFromLocal(super.repository);
}
