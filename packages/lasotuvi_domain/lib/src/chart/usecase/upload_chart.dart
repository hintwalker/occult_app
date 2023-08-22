import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';
import '../repository/chart_repository.dart';

class UploadChart extends Upload<Chart, ChartRepository> {
  UploadChart({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
