import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/subscription_model.dart';

class SubscriptionListCloudDataSource
    extends CloudDataSource<SubscriptionModel> {
  SubscriptionListCloudDataSource(
    super.service, {
    required super.itemMapper,
    required super.listMapper,
    required super.availableNetwork,
  });
  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/s';
}
