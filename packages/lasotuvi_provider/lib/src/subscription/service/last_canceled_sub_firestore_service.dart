import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../firebase/firebase_firestore_provider.dart';
import '../../utils/check_network_status.dart';

final lastCanceledSubFirestoreServiceProvider = Provider(
  (ref) => SubscriptionFirestoreService(
      ref.watch(
        firebaseFirestoreProvider,
      ),
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
