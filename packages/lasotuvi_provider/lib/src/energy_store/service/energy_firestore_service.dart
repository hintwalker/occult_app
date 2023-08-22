import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../firebase/firebase_firestore_provider.dart';
import '../../utils/check_network_status.dart';

final energyFirestoreServiceProvider = Provider(
  (ref) => EnergyFirestoreService(
      ref.watch(
        firebaseFirestoreProvider,
      ),
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
