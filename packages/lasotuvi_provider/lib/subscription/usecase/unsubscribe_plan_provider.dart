part of lasotuvi_provider;

final unSubscribePlanProvider = Provider.autoDispose<UnSubscribePlan>((ref) =>
    UnSubscribePlan(
        currentSubscriptionRepository: ref.read(currentSubRepositoryProvider)));
