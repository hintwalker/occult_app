part of lasotuvi_provider;

final takeStoragePlanByIdProvider = Provider.autoDispose<TakeStoragePlanById>(
    (ref) => TakeStoragePlanById(ref.read(storagePlanRepositoryProvider)));
