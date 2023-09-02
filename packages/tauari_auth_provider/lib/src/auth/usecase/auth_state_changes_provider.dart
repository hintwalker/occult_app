import 'package:riverpod/riverpod.dart';

import '../repository/auth_repository_provider.dart';

final authStateChangesProvider = StreamProvider.autoDispose(
    (ref) => ref.read(authRepositoryProvider).authStateChanges());
