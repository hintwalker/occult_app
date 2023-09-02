import 'package:riverpod/riverpod.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_firebase_provider/tauari_firebase_provider.dart';
import 'package:tauari_utils/tauari_utils.dart';

final userFirestoreServiceProvider = Provider(
  (ref) => UserFirestoreService(
    ref.watch(
      firebaseFirestoreProvider,
    ),
    availableNetwork: availableNetwork,
  ),
);
