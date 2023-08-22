import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';

import '../../firebase/firebase_firestore_provider.dart';

final chartFirestoreServiceProvider = Provider(
  (ref) => ChartFirestoreService(
      ref.watch(
        firebaseFirestoreProvider,
      ),
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
