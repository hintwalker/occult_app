import 'package:cloud_firestore/cloud_firestore.dart';

import '../data_test/test_uid.dart';

class TestRepository {
  final FirebaseFirestore firestore;
  TestRepository(this.firestore);
  // static const testUid = 'blackmoonj78.gmail.com';
  late final energyDoc = firestore.doc('e/$testUid/e/i');
  late final chartCollection = firestore.collection('tuvi/$testUid/c');
  Future<int?> fetchEnergy() async {
    final snapshot = await energyDoc.get();
    return snapshot.data()?['v'];
  }

  Future<Iterable<Map>?> fetchCharts() async {
    final snapshot = await chartCollection.get();
    return snapshot.docs.map((e) => {e.id: e.data()});
  }
}
