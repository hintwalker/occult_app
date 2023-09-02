import 'package:riverpod/riverpod.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../tauari_firebase_provider.dart';

final firebaseStorageServiceProvider =
    Provider.autoDispose<FirebaseStorageService>(
  (ref) => FirebaseStorageService(
    ref.read(firebaseStorageProvider),
  ),
);
