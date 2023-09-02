import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../repository/auth_repository_provider.dart';

final signOutProvider = Provider<SignOut>((ref) => SignOut(
      ref.read(authRepositoryProvider),
    ));
