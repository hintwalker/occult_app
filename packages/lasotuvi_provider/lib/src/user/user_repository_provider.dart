import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import 'user_cache_data_source.dart';
import 'user_firestore_data_source.dart';

final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) =>
    UserRepositoryImpl(ref.read(userCacheDataSourceProvider),
        onlineDataSource: ref.read(userFirestoreDataSourceProvider)));
