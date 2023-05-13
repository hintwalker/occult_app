part of lasotuvi_data;

class FirebaseChartTagDataSource extends RemoteDataSource<ChartTagModel> {
  FirebaseChartTagDataSource(super.service)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: ChartTagModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: ChartTagModel.fromMap),
        );

  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/ct';
}
