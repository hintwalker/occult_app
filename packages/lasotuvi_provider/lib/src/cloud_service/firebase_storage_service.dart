import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/firebase/firebase_storage.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

final firebaseStorageServiceProvider =
    Provider.autoDispose<FirebaseStorageService>(
  (ref) => FirebaseStorageService(
    ref.read(firebaseStorageProvider),
  ),
);
