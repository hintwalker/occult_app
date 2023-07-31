import 'package:tauari_data_core/tauari_data_core.dart';

import '../../entity/subscription.dart';
import '../../model/subscription_model.dart';
import '../current_subscription_repository.dart';

class CurrentSubRepositoryImpl
    extends CloudSingleDocRepositoryImpl<Subscription, SubscriptionModel>
    implements CurrentSubscriptionRepository {
  CurrentSubRepositoryImpl(super.dataSource)
      : super(entityToModel: (e) => SubscriptionModel.fromEntity(e));
}
