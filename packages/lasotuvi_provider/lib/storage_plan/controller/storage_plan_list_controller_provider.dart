part of lasotuvi_provider;

final storagePlanListControllerProvider =
    ChangeNotifierProvider.autoDispose<StoragePlanListController>(
        (ref) => StoragePlanListController(
              takeAllStoragePlans: ref.read(takeAllStoragePlansProvider),
              subscribePlan: ref.read(subscribePlanProvider),
              unSubscribePlan: ref.read(unSubscribePlanProvider),
              extendsSubscription: ref.read(extendsSubscriptionProvider),
              takeCurrentUser: ref.read(takeCurrentUserProvider),
              hasConnection: availableNetwork,
            ));
