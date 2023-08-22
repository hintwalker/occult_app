import 'package:energy_store/energy_store.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import '../data_test/test_uid.dart';
import 'test_repository.dart';

class FirestoreTestHelper {
  late final FakeFirebaseFirestore firestore;
  late final TestRepository repository;

  Future<void> ready() async {
    firestore = FakeFirebaseFirestore();
    repository = TestRepository(firestore);
    await setDummyEnergy(firestore);
    await setDummyCharts(firestore);
  }

  Future<void> setDummyEnergy(FakeFirebaseFirestore firestore) async {
    await firestore
        .collection('e')
        .doc(testUid)
        .collection('e')
        .doc(docIdEnergy)
        .set({
      ColumnEnergy.value: 10,
    });
  }

  Future<void> setDummyCharts(FakeFirebaseFirestore firebaseFirestore) async {
    await firestore
        .collection('tuvi')
        .doc(testUid)
        .collection('c')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(
      {'n': 'Hinh'},
    );
    Future.delayed(const Duration(milliseconds: 1));
    await firestore
        .collection('tuvi')
        .doc(testUid)
        .collection('c')
        .doc(DateTime.now().millisecondsSinceEpoch.toString())
        .set(
      {'n': 'Thu'},
    );
  }
}
