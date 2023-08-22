import 'package:energy_store/energy_store.dart';

import '../data_source/energy_data_source_mock.dart';

final energyCacheRepositoryMock = EnergyFirestoreRepository(
  energyCacheDataSourceMock,
  onlineDataSource: energyCloudDataSourceMock,
);
final energyCloudRepositoryMock = EnergyFirestoreRepository(
  energyCloudDataSourceMock,
  onlineDataSource: energyCloudDataSourceMock,
);
