import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_utils/tauari_utils.dart';

final userCacheServiceProvider = Provider(
  (ref) => UserCacheService(
    availableNetwork: availableNetwork,
  ),
);
