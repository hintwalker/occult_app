import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import '../../utils/check_network_status.dart';

final lastCanceledSubCacheServiceProvider = Provider(
  (ref) => LastCanceledSubCacheService(
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
