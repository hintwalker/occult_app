part of lasotuvi_storage_plan;

class FirebaseStoragePlanDataSource extends RemoteDataSource<StoragePlanModel> {
  FirebaseStoragePlanDataSource(super.service)
      : super(
            itemMapper: (snapshot) => snapshotToModel(snapshot,
                fromMap: StoragePlanModel.fromMap, idIsString: true),
            listMapper: (snapshot) => snapshotToModelList(snapshot,
                fromMap: StoragePlanModel.fromMap, idIsString: true));

  @override
  String dataCollectionPath(String uid) => 'sp';
}
