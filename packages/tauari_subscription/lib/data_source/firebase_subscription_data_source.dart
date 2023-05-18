part of tauari_subscription;

class FirebaseSubscriptionDataSource
    extends RemoteDataSource<SubscriptionModel> {
  FirebaseSubscriptionDataSource(super.service)
      : super(
            itemMapper: (snapshot) =>
                snapshotToModel(snapshot, fromMap: SubscriptionModel.fromMap),
            listMapper: (snapshot) => snapshotToModelList(snapshot,
                fromMap: SubscriptionModel.fromMap));

  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/s';
}
