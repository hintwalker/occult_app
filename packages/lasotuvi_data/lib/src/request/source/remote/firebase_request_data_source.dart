import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/request_model.dart';

class FirebaseRequestDataSource extends RemoteDataSource<RequestModel> {
  FirebaseRequestDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: RequestModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: RequestModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/r';
}
