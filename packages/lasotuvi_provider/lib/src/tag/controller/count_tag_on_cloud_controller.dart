import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_tag_shared/lasotuvi_tag_shared.dart';
import '../../utils/check_network_status.dart';
import '../usecase/on_count_tag_on_cloud.dart';

final countTagOnCloudControllerProvider =
    ChangeNotifierProvider.autoDispose<CountTagOnCloudController>(
  (ref) => CountTagOnCloudController(
      onCountOnCloud: ref.read(onCountTagOnCloudProvider),
      checkNetworkStatus: ref.read(checkNetworkStatusProvider)),
);
