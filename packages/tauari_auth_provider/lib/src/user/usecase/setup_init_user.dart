import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../repository/user_repository_provider.dart';

final setupInitUserProvider = Provider.autoDispose<SetupInitUser>(
  (ref) => SetupInitUser(
    ref.read(userRepositoryProvider),
  ),
);
