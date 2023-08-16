import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_commentary_shared/lasotuvi_commentary_shared.dart';
import '../../utils/check_network_status.dart';
import '../usecase/on_count_commentary_on_cloud.dart';

final countCommentaryOnCloudControllerProvider =
    ChangeNotifierProvider.autoDispose<CountCommentaryOnCloudController>(
  (ref) => CountCommentaryOnCloudController(
      onCountOnCloud: ref.read(onCountCommentaryOnCloudProvider),
      checkNetworkStatus: ref.read(checkNetworkStatusProvider)),
);
