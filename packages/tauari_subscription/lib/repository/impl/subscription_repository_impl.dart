part of tauari_subscription;

class SubscriptionRepositoryImpl
    extends CloudRepositoryImpl<Subscription, SubscriptionModel>
    implements SubscriptionRepository {
  SubscriptionRepositoryImpl(super.dataSource)
      : super(entityToModel: (e) => SubscriptionModel.fromEntity(e));
}
