import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_repository.dart';

class UpdateChart extends Update<Chart, ChartRepository> {
  UpdateChart({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
