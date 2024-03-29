import 'tag_cloud_data_source.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

// import '../../../chart_tag/model/chart_tag_model.dart';
import '../../model/tag_model.dart';

class TagFirestoreDataSource extends TagCloudDataSource {
  TagFirestoreDataSource(
    super.firestoreService, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: TagModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: TagModel.fromMap),
        );

  // String refCollectionPath(String uid) => 'tuvi/$uid/ct';

  // Future<int> insertCharts(String uid, Iterable<ChartTagModel> data) async {
  //   try {
  //     for (var item in data) {
  //       service.addToCollection(
  //         data: item.toCloud(),
  //         collectionPath: refCollectionPath(uid),
  //       );
  //     }

  //     // (dao as TagDao).insertCharts(charts.map((e) => e.toSqlite()));
  //     return data.length;
  //   } catch (e) {
  //     return 0;
  //   }
  // }

  // Future<int> removeCharts(
  //   String uid,
  //   Iterable<int> ids,
  // ) async {
  //   try {
  //     for (var id in ids) {
  //       await service.deleteDocumentFromCollection(
  //           collectionPath: refCollectionPath(uid), docId: id.toString());
  //     }
  //   } catch (e) {
  //     return 0;
  //   }

  //   return ids.length;
  // }
}
