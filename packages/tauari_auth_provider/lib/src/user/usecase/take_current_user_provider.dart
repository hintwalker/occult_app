import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../../auth/repository/auth_repository_provider.dart';

final takeCurrentUserProvider = Provider.autoDispose<TakeCurrentUser>(
  (ref) => TakeCurrentUser(ref.read(authRepositoryProvider)),
);
