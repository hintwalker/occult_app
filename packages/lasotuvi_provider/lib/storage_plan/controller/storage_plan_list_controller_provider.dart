part of lasotuvi_provider;

final storagePlanListControllerProvider =
    ChangeNotifierProvider.autoDispose<StoragePlanListController>((ref) =>
        StoragePlanListController(
            takeAllStoragePlans: ref.read(takeAllStoragePlansProvider)));
