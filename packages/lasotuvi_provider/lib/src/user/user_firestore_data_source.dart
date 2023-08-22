import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'service/user_firestore_service.dart';

final userFirestoreDataSourceProvider = Provider.autoDispose<UserDataSource>(
  (ref) => UserDataSource(
    ref.read(userFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
