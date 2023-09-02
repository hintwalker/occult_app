import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../repository/user_repository_provider.dart';

final setUserProvider = Provider.autoDispose<SetUser>(
    (ref) => SetUser(ref.read(userRepositoryProvider)));
