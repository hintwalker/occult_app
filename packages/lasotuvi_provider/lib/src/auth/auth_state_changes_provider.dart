import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository_provider.dart';

final authStateChangesProvider = StreamProvider.autoDispose(
    (ref) => ref.read(authRepositoryProvider).authStateChanges());
