part of lasotuvi_provider;

final subscribePlanProvider = Provider.autoDispose<SubscribePlan>((ref) =>
    SubscribePlan(
        subscriptionRepository: ref.read(subscriptionRepositoryProvider),
        currentSubscriptionRepository: ref.read(currentSubRepositoryProvider)));
