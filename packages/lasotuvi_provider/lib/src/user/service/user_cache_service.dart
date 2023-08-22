import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final userCacheServiceProvider = Provider(
  (ref) => UserCacheService(
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
