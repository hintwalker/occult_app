import 'package:tauari_firebase/tauari_firebase.dart';

class NotificationFirestoreService extends FirestoreService {
  NotificationFirestoreService(
    super.firestore, {
    required super.availableNetwork,
  });
}
