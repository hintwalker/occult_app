import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/commentary_model.dart';

class FirebaseCommentaryDataSource extends RemoteDataSource<CommentaryModel> {
  FirebaseCommentaryDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: CommentaryModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: CommentaryModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/cm';

  String ownerCollectionPath(String uid) => 'tuvi/$uid/c';
}
