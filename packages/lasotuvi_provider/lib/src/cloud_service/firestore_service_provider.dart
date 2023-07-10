import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../firebase/firebase_firestore_provider.dart';

final firestoreServiceProvider = Provider.autoDispose<CloudService>(
  (ref) => FirestoreService(ref.read(firebaseFirestoreProvider)),
);
