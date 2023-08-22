import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

class StoragePlanFirestoreDataSource extends StoragePlanCloudDataSource {
  StoragePlanFirestoreDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) => snapshotToModel(snapshot,
              fromMap: StoragePlanModel.fromMap, idIsString: true),
          listMapper: (snapshot) => snapshotToModelList(snapshot,
              fromMap: StoragePlanModel.fromMap, idIsString: true),
        );
}
