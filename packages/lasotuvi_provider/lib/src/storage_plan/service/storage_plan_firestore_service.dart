import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/firebase/firebase_firestore_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../utils/check_network_status.dart';

final storagePlanFirestoreServiceProvider = Provider(
  (ref) => StoragePlanFirestoreService(ref.read(firebaseFirestoreProvider),
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
