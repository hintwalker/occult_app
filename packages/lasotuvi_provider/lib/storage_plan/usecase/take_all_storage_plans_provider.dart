part of lasotuvi_provider;

final takeAllStoragePlansProvider = Provider.autoDispose<TakeAllStoragePlans>(
    (ref) => TakeAllStoragePlans(ref.read(storagePlanRepositoryProvider)));
