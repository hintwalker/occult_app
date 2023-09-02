import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_utils/tauari_utils.dart';
import '../service/user_cache_service.dart';

final userCacheDataSourceProvider = Provider.autoDispose<UserDataSource>(
  (ref) => UserDataSource(
    ref.read(userCacheServiceProvider),
    availableNetwork: availableNetwork,
  ),
);
