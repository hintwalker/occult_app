import 'package:tauari_firebase/tauari_firebase.dart';

class RequestFirestoreService extends FirestoreService {
  RequestFirestoreService(
    super.firestore, {
    required super.availableNetwork,
  });
}
