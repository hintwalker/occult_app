import 'package:lstv_firestore_cache/src/helper/firestore_cache_helper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../data_test/test_uid.dart';
import '../helper/firestore_test_helper.dart';
import '../helper/init_cache.dart';

class RemoteFileServiceMock extends Mock implements RemoteFileService {}

bool availableNetwork() => true;
final cache = FirestoreCacheHelper();
final firestoreTestHelper = FirestoreTestHelper();

Future<void> setupThings() async {
  final path = initTestCache();
  await cache.ready(testUid, path: path);

  await firestoreTestHelper.ready();
}
