import 'package:tauari_subscription/tauari_subscription.dart';

import '../mapper/cache_to_model.dart';
import '../mapper/cache_to_model_list.dart';

class SubscriptionListCacheDataSource extends SubscriptionListCloudDataSource {
  SubscriptionListCacheDataSource(
    super.service, {
    required super.availableNetwork,
  }) : super(
          itemMapper: (snapshot) =>
              cacheToModel(snapshot, fromMap: SubscriptionModel.fromMap),
          listMapper: (snapshot) =>
              cacheToModelList(snapshot, fromMap: SubscriptionModel.fromMap),
        );
}
