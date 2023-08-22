import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import 'package:lstv_test/lstv_test.dart';

final pullEnergyMock = PullEnergy(
  cacheRepository: energyCacheRepositoryMock,
  // cloudRepository: energyCloudRepositoryMock,
);
