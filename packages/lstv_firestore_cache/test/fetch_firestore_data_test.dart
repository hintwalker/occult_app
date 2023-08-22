// ignore_for_file: avoid_print

import 'package:flutter_test/flutter_test.dart';
import 'helper/firestore_test_helper.dart';

late final FirestoreTestHelper firestoreTestHelper;
void main() {
  setUp(() async {
    firestoreTestHelper = FirestoreTestHelper();
    await firestoreTestHelper.ready();
  });
  group('fetch data from Firestor', () {
    test('fetch energy', () async {
      final energy = await firestoreTestHelper.repository.fetchEnergy();
      print(energy);
    });
  });
}
