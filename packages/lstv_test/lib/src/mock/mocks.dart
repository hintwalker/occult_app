import 'dart:io';

import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../data_test/test_uid.dart';
import '../firestore/firestore_test.dart';

class RemoteFileServiceMock extends Mock implements RemoteFileService {}

bool availableNetwork() => true;
final cache = FirestoreCacheHelper();
final firestoreTestHelper = FirestoreTest();

Future<void> setupThings() async {
  var path = Directory.current.path;
  final hivePath = '$path/test/hive_testing_path';
  FirestoreCacheHelper.initCache(hivePath);
  await cache.ready(testUid, path: hivePath);

  await firestoreTestHelper.ready();
}
