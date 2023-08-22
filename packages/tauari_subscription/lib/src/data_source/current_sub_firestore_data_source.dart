import 'package:tauari_firebase/tauari_firebase.dart';
import 'current_sub_cloud_data_source.dart';

import '../model/subscription_model.dart';

class CurrentSubFirestoreDataSource extends CurrentSubCloudDataSource {
  CurrentSubFirestoreDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: SubscriptionModel.fromMap),
        );
}
