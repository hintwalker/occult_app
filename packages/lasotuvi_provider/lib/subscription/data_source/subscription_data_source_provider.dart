part of lasotuvi_provider;

final subscriptionDataSourceProvider =
    Provider.autoDispose<FirebaseSubscriptionDataSource>((ref) =>
        FirebaseSubscriptionDataSource(ref.read(firestoreServiceProvider)));
