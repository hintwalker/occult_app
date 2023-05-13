part of lasotuvi_data;

class FirebaseChartDataSource extends RemoteDataSource<ChartModel> {
  FirebaseChartDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: ChartModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: ChartModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/charts';
}
