import 'package:tauari_subscription/tauari_subscription.dart';

import '../mapper/cache_to_model.dart';

class CurrentSubCacheDataSource extends CurrentSubCloudDataSource {
  CurrentSubCacheDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: SubscriptionModel.fromMap),
        );
}
