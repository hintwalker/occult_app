import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../../auth/repository/auth_repository_provider.dart';

final onCurrentUserProvider = Provider.autoDispose<OnCurrentUser>(
  (ref) => OnCurrentUser(
    ref.read(authRepositoryProvider),
  ),
);
