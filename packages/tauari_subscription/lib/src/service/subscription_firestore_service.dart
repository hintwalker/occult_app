import 'package:tauari_firebase/tauari_firebase.dart';

class SubscriptionFirestoreService extends FirestoreService {
  SubscriptionFirestoreService(
    super.firestore, {
    required super.availableNetwork,
  });
}
