import 'package:tauari_firebase/tauari_firebase.dart';

class NoteFirestoreService extends FirestoreService {
  NoteFirestoreService(
    super.firestore, {
    required super.availableNetwork,
  });
}
