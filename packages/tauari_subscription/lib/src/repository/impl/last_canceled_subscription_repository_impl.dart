import 'package:tauari_data_core/tauari_data_core.dart';

import '../../entity/subscription.dart';
import '../../model/subscription_model.dart';
import '../last_canceled_subscription_repository.dart';

class LastCanceledSubscriptionRepositoryImpl
    extends CloudSingleDocRepositoryImpl<Subscription, SubscriptionModel>
    implements LastCanceledSubscriptionRepository {
  LastCanceledSubscriptionRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
  }) : super(entityToModel: (e) => SubscriptionModel.fromEntity(e));
}
