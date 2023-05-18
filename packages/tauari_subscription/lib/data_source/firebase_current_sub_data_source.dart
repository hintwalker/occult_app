part of tauari_subscription;

class FirebaseCurrentSubDataSource
    extends CloudSingleDocDataSource<SubscriptionModel> {
  FirebaseCurrentSubDataSource(super.service)
      : super(
          itemMapper: (snapshot) =>
              snapshotToModel(snapshot, fromMap: SubscriptionModel.fromMap),
        );

  @override
  String dataCollectionPath(String uid) => 'tuvi/$uid/cs';

  @override
  String get docId => '0';
}
