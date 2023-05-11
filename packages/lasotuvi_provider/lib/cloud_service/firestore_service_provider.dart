part of lasotuvi_provider;

final firestoreServiceProvider = Provider.autoDispose<CloudService>(
  (ref) => FirestoreService(ref.read(firebaseFirestoreProvider)),
);
