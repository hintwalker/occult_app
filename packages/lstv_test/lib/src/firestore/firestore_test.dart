import 'package:energy_store/energy_store.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:lstv_test/src/data_test/test_initial_value.dart';
import '../data_test/test_uid.dart';

class FirestoreTest {
  late final FakeFirebaseFirestore firestore;

  Future<void> ready() async {
    firestore = FakeFirebaseFirestore();
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
      ColumnEnergy.value: inititalEnergy,
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
