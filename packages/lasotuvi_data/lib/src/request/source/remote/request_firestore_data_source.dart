import 'request_cloud_data_source.dart';

import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/request_model.dart';

class RequestFirestoreDataSource extends RequestCloudDataSource {
  RequestFirestoreDataSource(
    super.firestoreService, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: RequestModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: RequestModel.fromMap),
        );
}
