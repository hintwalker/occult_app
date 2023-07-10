import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../usecase/update_current_sub_provider.dart';

final expiredTimerControllerProvider =
    ChangeNotifierProvider<ExpiredTimerController>(
        (ref) => ExpiredTimerController(ref.read(updateCurrentSubProvider)));
