part of lasotuvi_provider;

final firebaseFirestoreProvider = Provider.autoDispose<FirebaseFirestore>(
    (ref) => FirebaseFirestore.instance);
