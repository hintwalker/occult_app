import 'package:tauari_firebase/tauari_firebase.dart';

class EnergyFirestoreService extends FirestoreService {
  EnergyFirestoreService(
    super.firestore, {
    required super.availableNetwork,
  });
}
