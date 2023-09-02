import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../../auth/repository/auth_repository_provider.dart';

final currentUserProvider = Provider<UserEntity?>(
    (ref) => ref.read(authRepositoryProvider).currentUser());
