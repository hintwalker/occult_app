import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

final firestoreCacheHelperProvider = Provider<FirestoreCacheHelper>(
  (ref) => FirestoreCacheHelper(),
);
