part of lasotuvi_provider;

final currentSubDataSourceProvider =
    Provider.autoDispose<FirebaseCurrentSubDataSource>((ref) =>
        FirebaseCurrentSubDataSource(ref.read(firestoreServiceProvider)));
