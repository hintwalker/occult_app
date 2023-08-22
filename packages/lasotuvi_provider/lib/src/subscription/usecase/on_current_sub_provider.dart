import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../repository/current_sub_cache_repository.dart';

final onCurrentSubProvider = Provider.autoDispose<OnCurrentSub>(
    (ref) => OnCurrentSub(ref.read(currentSubCacheRepositoryProvider)));
