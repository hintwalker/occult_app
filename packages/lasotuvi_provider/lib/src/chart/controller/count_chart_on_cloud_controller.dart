import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart_shared/lasotuvi_chart_shared.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import '../usecase/on_count_chart_on_cloud.dart';

final countChartOnCloudControllerProvider =
    ChangeNotifierProvider.autoDispose<CountChartOnCloudController>(
  (ref) => CountChartOnCloudController(
      onCountOnCloud: ref.read(onCountChartOnCloudProvider),
      checkNetworkStatus: ref.read(checkNetworkStatusProvider)),
);
