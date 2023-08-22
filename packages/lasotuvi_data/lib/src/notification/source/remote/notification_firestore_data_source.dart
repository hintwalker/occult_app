import 'notification_cloud_data_source.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../../model/notification_model.dart';

class NotificationFirestoreDataSource extends NotificationCloudDataSource {
  NotificationFirestoreDataSource(
    super.firestoreService, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: NotificationModel.fromMap),
          listMapper: (snapshot) =>
              snapshotToModelList(snapshot, fromMap: NotificationModel.fromMap),
        );
}
