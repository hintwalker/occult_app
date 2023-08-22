import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/subscription_model.dart';

class LastCanceledSubCloudDataSource
    extends CloudSingleDocDataSource<SubscriptionModel> {
  LastCanceledSubCloudDataSource(
    super.service, {
    required super.itemMapper,
    required super.availableNetwork,
  });
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/lcs';

  @override
  String get docId => '0';
}
