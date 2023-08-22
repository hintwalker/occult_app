import 'package:energy_store/energy_store.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

import '../../mock/mocks.dart';

final energyCacheServiceMock = EnergyCacheService(
  box: cache.energyBox,
  availableNetwork: availableNetwork,
);
final energyCloudServiceMock = EnergyFirestoreService(
  firestoreTestHelper.firestore,
  availableNetwork: availableNetwork,
);
