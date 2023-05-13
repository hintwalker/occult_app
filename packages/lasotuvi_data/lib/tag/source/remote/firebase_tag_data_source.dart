part of lasotuvi_data;

class FirebaseTagDataSource extends RemoteDataSource<TagModel> {
  FirebaseTagDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: TagModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: TagModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/tags';

  String refCollectionPath(String uid) => 'tuvi/$uid/ct';

  Future<int> insertCharts(String uid, Iterable<ChartTagModel> data) async {
    try {
      for (var item in data) {
        service.addToCollection(
          data: item.toCloud(),
          collectionPath: refCollectionPath(uid),
        );
      }

      // (dao as TagDao).insertCharts(charts.map((e) => e.toSqlite()));
      return data.length;
    } catch (e) {
      return 0;
    }
  }

  Future<int> removeCharts(
    String uid,
    Iterable<int> ids,
  ) async {
    try {
      for (var id in ids) {
        await service.deleteDocumentFromCollection(
            collectionPath: refCollectionPath(uid), docId: id.toString());
      }
    } catch (e) {
      return 0;
    }

    return ids.length;
  }
}
