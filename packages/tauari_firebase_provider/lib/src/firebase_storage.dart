import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod/riverpod.dart';

final firebaseStorageProvider =
    Provider.autoDispose<FirebaseStorage>((ref) => FirebaseStorage.instance);
