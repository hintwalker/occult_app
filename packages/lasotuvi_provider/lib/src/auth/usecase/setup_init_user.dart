import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../../user/user_repository_provider.dart';

final setupInitUserProvider = Provider.autoDispose<SetupInitUser>(
  (ref) => SetupInitUser(
    ref.read(userRepositoryProvider),
  ),
);
