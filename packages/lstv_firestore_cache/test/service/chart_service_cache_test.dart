// // ignore_for_file: avoid_print

// import 'package:flutter_test/flutter_test.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';
// import 'package:lstv_firestore_cache/src/data_source/chart_cache_data_source.dart';
// import 'package:lstv_firestore_cache/src/service/chart_cache_service.dart';
// import 'package:lstv_firestore_cache/src/usecase/pull_chart.dart';

// import '../data_test/test_uid.dart';
// import '../mock/mocks.dart';

// void main() {
//   late final ChartCacheService chartCacheService;
//   late final ChartCloudRepository chartCacheRepository;
//   late final ChartCloudRepository chartCloudRepository;

//   Future<void> setupData() async {
//     chartCacheService = ChartCacheService(
//       box: cache.chartBox,
//       availableNetwork: availableNetwork,
//     );

//     final cloudService = ChartFirestoreService(
//       firestoreTestHelper.firestore,
//       availableNetwork: availableNetwork,
//     );

//     final cacheDatasource = ChartCacheDataSource(chartCacheService,
//         remoteFileService: RemoteFileServiceMock(),
//         availableNetwork: availableNetwork);
//     final cloudDataSource = ChartFirestoreDataSource(
//       cloudService,
//       remoteFileService: RemoteFileServiceMock(),
//       availableNetwork: availableNetwork,
//     );

//     chartCacheRepository = ChartCloudRepositoryImpl(
//       cacheDatasource,
//       onlineDataSource: cloudDataSource,
//     );
//     // chartCloudRepository = ChartCloudRepositoryImpl(cloudDataSource);
//     final puller = PullChart(
//       cacheRepository: chartCacheRepository,
//       // cloudRepository: chartCloudRepository,
//     );
//     await puller(testUid, refresh: true);
//   }

//   setUpAll(() async {
//     await setupThings();
//     await setupData();
//   });

//   tearDownAll(() async {
//     await cache.close(clearAllData: true);
//   });

//   group('Chart', () {
//     // test('should check chart exist', () async {
//     //   final exists = await chartCacheService.exists(
//     //     collectionPath: 'e/$testUid/e',
//     //     docId: 'i',
//     //     online: true,
//     //   );
//     //   expect(exists, true);
//     // });
//     test('should get charts', () async {
//       final cloudEnergy = await chartCloudRepository.dataCloud(testUid);
//       final cacheEnergy = await chartCacheRepository.dataCloud(testUid);
//       for (var i = 0; i < cloudEnergy.length; i++) {
//         print(
//             'cloud: ${cloudEnergy.elementAt(i).dump()}, \ncache: ${cacheEnergy.elementAt(i).dump()}\n');
//       }

//       expect(cacheEnergy, cloudEnergy);
//     });

//     test('should get chart by id', () async {
//       final cacheChartList = await chartCacheRepository.dataCloud(testUid);

//       final cacheChart = await chartCacheRepository.byIdOnCloud(
//         uid: testUid,
//         docId: cacheChartList.elementAt(0).docId,
//       );
//       expect(cacheChart?.name, 'Hinh');
//     });

//     test('should update chart', () async {
//       final cacheChartList = await chartCacheRepository.dataCloud(testUid);

//       final cacheChart = await chartCacheRepository.byIdOnCloud(
//         uid: testUid,
//         docId: cacheChartList.elementAt(0).docId,
//       );
//       await chartCacheRepository.updateOnCloud(
//         cacheChart!.copyWith(name: 'H'),
//         testUid,
//         true,
//       );
//       final newChart = await chartCacheRepository.byIdOnCloud(
//         uid: testUid,
//         docId: cacheChartList.elementAt(0).docId,
//       );
//       expect(newChart?.name, 'H');
//     });

//     test('should delete chart', () async {
//       var cacheChartList = await chartCacheRepository.dataCloud(testUid);
//       assert(cacheChartList.length == 2);
//       final cacheChart = await chartCacheRepository.byIdOnCloud(
//         uid: testUid,
//         docId: cacheChartList.elementAt(0).docId,
//       );

//       await chartCacheRepository.deleteFromCloud(
//         uid: testUid,
//         docId: cacheChart!.docId,
//         refresh: true,
//       );
//       cacheChartList = await chartCacheRepository.dataCloud(testUid);
//       expect(cacheChartList.length, 1);
//     });
//   });
// }
