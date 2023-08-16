import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class CountChartOnCloudController extends CountOnCloudController<Chart> {
  CountChartOnCloudController({
    required super.onCountOnCloud,
    required super.checkNetworkStatus,
  });
}
