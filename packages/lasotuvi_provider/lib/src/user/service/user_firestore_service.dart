import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_auth/tauari_auth.dart';

final userFirestoreServiceProvider = Provider(
  (ref) => UserFirestoreService(
    ref.watch(
      firebaseFirestoreProvider,
    ),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
