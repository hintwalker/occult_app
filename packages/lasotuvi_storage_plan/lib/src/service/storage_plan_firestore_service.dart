import 'package:tauari_firebase/tauari_firebase.dart';

class StoragePlanFirestoreService extends FirestoreService {
  StoragePlanFirestoreService(
    super.firestore, {
    required super.availableNetwork,
  });
}
