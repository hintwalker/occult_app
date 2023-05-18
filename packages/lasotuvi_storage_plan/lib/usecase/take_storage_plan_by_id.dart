part of lasotuvi_storage_plan;

class TakeStoragePlanById {
  final StoragePlanRepository repository;
  const TakeStoragePlanById(this.repository);
  Future<StoragePlan?> call(String? uid, String id) async =>
      uid == null ? null : await repository.byIdOnCloud(uid: uid, docId: id);
}
