import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../usecase/on_current_sub_provider.dart';

final currentSubControllerProvider = ChangeNotifierProvider(
    (ref) => CurrentSubController(ref.read(onCurrentSubProvider)));
