part of lasotuvi_provider;

final firebaseNoteDataSourceProvider =
    Provider.autoDispose<FirebaseNoteDataSource>(
  (ref) => FirebaseNoteDataSource(ref.read(firestoreServiceProvider)),
);
