import 'package:tauari_firebase/tauari_firebase.dart';

import '../model/subscription_model.dart';
import 'subscription_list_cloud_data_source.dart';

class SubscriptionListFirestoreDataSource
    extends SubscriptionListCloudDataSource {
  SubscriptionListFirestoreDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: SubscriptionModel.fromMap),
          listMapper: (snapshot) => snapshotToModelList(
            snapshot,
            fromMap: SubscriptionModel.fromMap,
          ),
        );
}
