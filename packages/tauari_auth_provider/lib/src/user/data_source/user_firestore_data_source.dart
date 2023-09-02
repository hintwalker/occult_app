import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_utils/tauari_utils.dart';
import '../service/user_firestore_service.dart';

final userFirestoreDataSourceProvider = Provider.autoDispose<UserDataSource>(
  (ref) => UserDataSource(
    ref.read(userFirestoreServiceProvider),
    availableNetwork: availableNetwork,
  ),
);
