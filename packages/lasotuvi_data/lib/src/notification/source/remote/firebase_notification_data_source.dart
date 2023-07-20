import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/notification_model.dart';

class FirebaseNotificationDataSource
    extends RemoteDataSource<NotificationModel> {
  FirebaseNotificationDataSource(super.firestoreService)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: NotificationModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: NotificationModel.fromMap),
        );
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/no';
}
