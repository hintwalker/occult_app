import 'package:lasotuvi_data/src/commentary/source/remote/commentary_cloud_data_source.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/commentary_model.dart';

class CommentaryFirestoreDataSource extends CommentaryCloudDataSource {
  CommentaryFirestoreDataSource(
    super.firestoreService, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: CommentaryModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: CommentaryModel.fromMap),
        );
}
