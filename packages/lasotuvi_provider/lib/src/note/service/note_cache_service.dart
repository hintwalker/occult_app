import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

import '../../utils/check_network_status.dart';

final noteCacheServiceProvider = Provider(
  (ref) => NoteCacheService(
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
