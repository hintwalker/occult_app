import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import 'user_repository_provider.dart';

final setUserProvider = Provider.autoDispose<SetUser>(
    (ref) => SetUser(ref.read(userRepositoryProvider)));
