import 'package:energy_store/energy_store.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import 'package:lstv_test/src/energy/service/energy_service_mock.dart';

import '../../mock/mocks.dart';

final energyCacheDataSourceMock = EnergyCacheDataSource(
  energyCacheServiceMock,
  availableNetwork: availableNetwork,
);
final energyCloudDataSourceMock = EnergyFirestoreDataSource(
  energyCloudServiceMock,
  availableNetwork: availableNetwork,
);
