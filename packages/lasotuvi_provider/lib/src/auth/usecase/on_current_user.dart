import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../auth_repository_provider.dart';

final onCurrentUserProvider = Provider.autoDispose<OnCurrentUser>(
  (ref) => OnCurrentUser(
    ref.read(authRepositoryProvider),
  ),
);
