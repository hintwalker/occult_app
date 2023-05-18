part of tauari_data_core;

abstract class CloudSingleDocDataSource<T extends CloudModel>
    implements NoSqlDataSource {
  final CloudService service;
  final T? Function(dynamic) itemMapper;
  String get docId;

  const CloudSingleDocDataSource(
    this.service, {
    required this.itemMapper,
  });

  Future<bool> insert(String uid, T item) async {
    try {
      await service.setDataOnDocument(
          doc: item.docId,
          data: item.toCloud(),
          collectionPath: dataCollectionPath(uid));
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(String uid, T doc) => insert(uid, doc);

  Future<bool> exist(String uid) =>
      service.exists(collectionPath: dataCollectionPath(uid), docId: docId);

  Future<bool> delete(String uid) async {
    try {
      await service.deleteDocumentFromCollection(
          collectionPath: dataCollectionPath(uid), docId: docId);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<T?> doc(String uid) async {
    final doc = await service.getFromDocument(
        collectionPath: dataCollectionPath(uid), docId: docId);
    if (!doc.exists) {
      return null;
    }
    return itemMapper(doc);
  }

  Stream<T?> onDoc(String uid) {
    final collection = dataCollectionPath(uid);
    final id = docId;
    return service
        .getSnapshotStreamFromDocument(collectionPath: collection, docId: id)
        .map((event) => event.data() == null ? null : itemMapper(event));
  }
}
