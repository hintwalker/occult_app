import 'package:tauari_data_core/tauari_data_core.dart';

import '../../entity/subscription.dart';
import '../../model/subscription_model.dart';
import '../subscription_repository.dart';

class SubscriptionRepositoryImpl
    extends CloudRepositoryImpl<Subscription, SubscriptionModel>
    implements SubscriptionRepository {
  SubscriptionRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
  }) : super(entityToModel: (e) => SubscriptionModel.fromEntity(e));
}
