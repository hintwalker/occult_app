import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import 'auth_repository_provider.dart';

final signOutProvider = Provider<SignOut>((ref) => SignOut(
      ref.read(authRepositoryProvider),
    ));
