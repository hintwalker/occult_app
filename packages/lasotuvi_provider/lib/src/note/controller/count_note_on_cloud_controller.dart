import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_note_shared/lasotuvi_note_shared.dart';
import '../../utils/check_network_status.dart';
import '../usecase/on_count_note_on_cloud.dart';

final countNoteOnCloudControllerProvider =
    ChangeNotifierProvider.autoDispose<CountNoteOnCloudController>(
  (ref) => CountNoteOnCloudController(
      onCountOnCloud: ref.read(onCountNoteOnCloudProvider),
      checkNetworkStatus: ref.read(checkNetworkStatusProvider)),
);
