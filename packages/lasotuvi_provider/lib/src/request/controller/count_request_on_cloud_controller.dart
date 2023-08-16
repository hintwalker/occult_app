import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_request_shared/lasotuvi_request_shared.dart';
import '../../utils/check_network_status.dart';
import '../usecase/on_count_request_on_cloud.dart';

final countRequestOnCloudControllerProvider =
    ChangeNotifierProvider.autoDispose<CountRequestOnCloudController>(
  (ref) => CountRequestOnCloudController(
      onCountOnCloud: ref.read(onCountRequestOnCloudProvider),
      checkNetworkStatus: ref.read(checkNetworkStatusProvider)),
);
