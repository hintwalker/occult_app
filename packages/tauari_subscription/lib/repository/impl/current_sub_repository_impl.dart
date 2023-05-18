part of tauari_subscription;

class CurrentSubRepositoryImpl
    extends CloudSingleDocRepositoryImpl<Subscription, SubscriptionModel>
    implements CurrentSubRepository {
  CurrentSubRepositoryImpl(super.dataSource)
      : super(entityToModel: (e) => SubscriptionModel.fromEntity(e));
}
