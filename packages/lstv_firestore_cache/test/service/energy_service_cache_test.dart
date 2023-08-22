// // ignore_for_file: avoid_print

// import 'package:energy_store/energy_store.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:lstv_firestore_cache/src/data_source/energy_cache_data_source.dart';

// import 'package:lstv_firestore_cache/src/service/energy_cache_service.dart';
// import 'package:lstv_firestore_cache/src/usecase/pull_energy.dart';

// import '../data_test/test_uid.dart';
// import '../mock/mocks.dart';

// void main() {
//   late final EnergyCacheService energyCacheService;

//   late final EnergyCloudRepository energyCacheRepository;
//   late final EnergyCloudRepository energyCloudRepository;

//   Future<void> setupEnergy() async {
//     energyCacheService = EnergyCacheService(
//       box: cache.energyBox,
//       availableNetwork: availableNetwork,
//     );
//     final cloudService = EnergyFirestoreService(
//       firestoreTestHelper.firestore,
//       availableNetwork: availableNetwork,
//     );
//     final cacheDatasource = EnergyCacheDataSource(energyCacheService,
//         availableNetwork: availableNetwork);
//     final cloudDataSource = EnergyFirestoreDataSource(
//       cloudService,
//       availableNetwork: availableNetwork,
//     );
//     energyCacheRepository = EnergyFirestoreRepository(cacheDatasource);
//     energyCloudRepository = EnergyFirestoreRepository(cloudDataSource);
//     final puller = PullEnergy(
//       cacheRepository: energyCacheRepository,
//       cloudRepository: energyCloudRepository,
//     );
//     await puller(testUid, refresh: true);
//   }

//   setUp(() async {
//     await setupThings();
//     await setupEnergy();
//   });

//   tearDownAll(() async {
//     await cache.close(clearAllData: true);
//   });

//   group('Energy', () {
//     test('should check energy exist', () async {
//       final exists = await energyCacheService.exists(
//         collectionPath: 'e/$testUid/e',
//         docId: 'i',
//         online: true,
//       );
//       expect(exists, true);
//     });
//     test('should get energy', () async {
//       final cloudEnergy = await energyCloudRepository.doc(testUid);
//       final cacheEnergy = await energyCacheRepository.doc(testUid);
//       print('cloud: ${cloudEnergy?.dump()}, cache: ${cacheEnergy?.dump()}');
//       expect(cacheEnergy, cloudEnergy);
//     });

//     test('should plus energy', () async {
//       await energyCacheRepository.plusEnergy(testUid, 20, refresh: true);
//       await energyCloudRepository.plusEnergy(testUid, 20, refresh: true);
//       final cacheEnergy = await energyCacheRepository.doc(testUid);
//       final cloudEnergy = await energyCloudRepository.doc(testUid);
//       print('cloud: ${cloudEnergy?.dump()}, cache: ${cacheEnergy?.dump()}');
//       expect(cacheEnergy, cloudEnergy);
//     });

//     test('should subtract energy', () async {
//       await energyCacheRepository.subtractEnergy(testUid, 10, refresh: true);
//       await energyCloudRepository.subtractEnergy(testUid, 10, refresh: true);
//       final cacheEnergy = await energyCacheRepository.doc(testUid);
//       final cloudEnergy = await energyCloudRepository.doc(testUid);
//       print('cloud: ${cloudEnergy?.dump()}, cache: ${cacheEnergy?.dump()}');
//       expect(cacheEnergy, cloudEnergy);
//     });
//   });

//   group('Chart', () {
//     test('should get charts', () async {});
//   });
// }
