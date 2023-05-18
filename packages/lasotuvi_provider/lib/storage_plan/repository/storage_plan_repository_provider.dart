part of lasotuvi_provider;

final storagePlanRepositoryProvider =
    Provider.autoDispose<StoragePlanRepositoryImpl>((ref) =>
        StoragePlanRepositoryImpl(ref.read(storagePlanDataSourceProvider)));
