import 'package:tauari_firebase/tauari_firebase.dart';
import 'last_canceled_sub_cloud_data_source.dart';

import '../model/subscription_model.dart';

class LastCanceledSubFirestoreDataSource
    extends LastCanceledSubCloudDataSource {
  LastCanceledSubFirestoreDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: SubscriptionModel.fromMap),
        );
}
