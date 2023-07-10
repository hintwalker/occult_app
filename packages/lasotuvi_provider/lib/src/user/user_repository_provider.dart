import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import 'user_data_source_provider.dart';

final userRepositoryProvider = Provider.autoDispose<UserRepository>(
    (ref) => UserRepositoryImpl(ref.read(userDataSourceProvider)));
