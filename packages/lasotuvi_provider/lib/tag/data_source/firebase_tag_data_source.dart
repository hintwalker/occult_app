part of lasotuvi_provider;

final firebaseTagDataSourceProvider =
    Provider.autoDispose<FirebaseTagDataSource>(
        (ref) => FirebaseTagDataSource(ref.read(firestoreServiceProvider)));
