part of lasotuvi_provider;

final firebaseChartTagDataSourceProvider =
    Provider.autoDispose<FirebaseChartTagDataSource>(
  (ref) => FirebaseChartTagDataSource(ref.read(firestoreServiceProvider)),
);
