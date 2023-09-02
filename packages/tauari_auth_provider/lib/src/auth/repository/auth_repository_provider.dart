import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../data_source/auth_data_source_provider.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepositoryImpl(
    ref.read(authDataSourceProvider),
  ),
);
