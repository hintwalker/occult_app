import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../model/storage_plan_model.dart';

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
