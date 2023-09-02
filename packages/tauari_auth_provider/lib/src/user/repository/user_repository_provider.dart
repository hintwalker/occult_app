import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';

import '../data_source/user_cache_data_source.dart';
import '../data_source/user_firestore_data_source.dart';

final userRepositoryProvider = Provider.autoDispose<UserRepository>((ref) =>
    UserRepositoryImpl(ref.read(userCacheDataSourceProvider),
        onlineDataSource: ref.read(userFirestoreDataSourceProvider)));
