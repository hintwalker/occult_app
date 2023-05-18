part of lasotuvi_storage_plan;

class TakeAllStoragePlans {
  final StoragePlanRepository repository;
  const TakeAllStoragePlans(this.repository);
  Future<Iterable<StoragePlan>> call(String? uid,
          [QueryArgs? queryArgs]) async =>
      uid == null ? [] : await repository.dataCloud(uid, queryArgs);
}
