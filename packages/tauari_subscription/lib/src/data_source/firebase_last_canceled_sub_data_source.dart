import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_firebase/tauari_firebase.dart';

import '../model/subscription_model.dart';

class FirebaseLastCanceledSubDataSource
    extends CloudSingleDocDataSource<SubscriptionModel> {
  FirebaseLastCanceledSubDataSource(super.service)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: SubscriptionModel.fromMap),
        );

  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/lcs';

  @override
  String get docId => '0';
}
