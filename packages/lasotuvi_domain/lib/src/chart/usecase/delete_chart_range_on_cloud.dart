import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class DeleteChartRangeOnCloud
    extends DeleteRangeOnCloud<Chart, ChartCloudRepository> {
  DeleteChartRangeOnCloud({
    required super.cacheRepository,
    // required super.cloudRepository,
  });
}
