part of lasotuvi_provider;

final firebaseChartDataSourceProvider =
    Provider.autoDispose<FirebaseChartDataSource>(
  (ref) => FirebaseChartDataSource(ref.read(firestoreServiceProvider)),
);
