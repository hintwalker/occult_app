part of lasotuvi_storage_plan;

class StoragePlanRepositoryImpl
    extends ReadOnlyCloudRepositoryImpl<StoragePlan, StoragePlanModel>
    implements StoragePlanRepository {
  StoragePlanRepositoryImpl(super.dataSource)
      : super(entityToModel: (e) => StoragePlanModel.fromEntity(e));
}
