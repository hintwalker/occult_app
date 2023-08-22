import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'service/user_cache_service.dart';

final userCacheDataSourceProvider = Provider.autoDispose<UserDataSource>(
  (ref) => UserDataSource(
    ref.read(userCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
