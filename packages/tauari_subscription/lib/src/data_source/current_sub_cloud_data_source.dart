import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/subscription_model.dart';

class CurrentSubCloudDataSource
    extends CloudSingleDocDataSource<SubscriptionModel> {
  CurrentSubCloudDataSource(super.service,
      {required super.itemMapper, required super.availableNetwork});
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/cs';

  @override
  String get docId => '0';
}
