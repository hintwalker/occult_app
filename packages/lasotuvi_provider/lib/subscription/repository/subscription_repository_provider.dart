part of lasotuvi_provider;

final subscriptionRepositoryProvider =
    Provider.autoDispose<SubscriptionRepository>((ref) =>
        SubscriptionRepositoryImpl(ref.read(subscriptionDataSourceProvider)));
