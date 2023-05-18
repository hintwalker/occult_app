part of lasotuvi_provider;

final storagePlanDataSourceProvider =
    Provider.autoDispose<FirebaseStoragePlanDataSource>((ref) =>
        FirebaseStoragePlanDataSource(ref.read(firestoreServiceProvider)));
