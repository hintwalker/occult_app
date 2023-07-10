import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../model/subscription_model.dart';

class FirebaseCurrentSubDataSource
    extends CloudSingleDocDataSource<SubscriptionModel> {
  FirebaseCurrentSubDataSource(super.service)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: SubscriptionModel.fromMap),
        );

  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/cs';

  @override
  String get docId => '0';
}
