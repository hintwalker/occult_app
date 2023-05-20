part of lasotuvi_provider;

final extendsSubscriptionProvider = Provider.autoDispose<ExtendsSubscription>(
    (ref) => ExtendsSubscription(
        currentSubscriptionRepository: ref.read(currentSubRepositoryProvider)));
