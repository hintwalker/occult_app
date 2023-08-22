import 'dart:async';

// import 'package:tauari_utils/tauari_utils.dart';

import '../model/cloud_model.dart';
import '../service/cloud_service.dart';
import 'no_sql_data_source.dart';

abstract class CloudSingleDocDataSource<T extends CloudModel>
    implements NoSqlDataSource {
  final CloudService service;
  final T? Function(dynamic) itemMapper;
  String get docId;
  final FutureOr<bool> Function() availableNetwork;

  const CloudSingleDocDataSource(
    this.service, {
    required this.itemMapper,
    required this.availableNetwork,
  });

  Future<bool> insert(
    String uid,
    T item,
    bool refresh,
  ) async {
    try {
      await service.setDataOnDocument(
        doc: item.docId,
        data: item.toCloud(),
        collectionPath: dataCollectionPath(uid),
        refresh: refresh,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(String uid, T doc, bool refresh) =>
      insert(uid, doc, refresh);

  Future<bool> exist(String uid) async {
    final online = await availableNetwork();
    return await service.exists(
      collectionPath: dataCollectionPath(uid),
      docId: docId,
      online: online,
    );
  }

  Future<bool> delete(
    String uid,
    bool refresh,
  ) async {
    final online = await availableNetwork();
    try {
      await service.deleteDocumentFromCollection(
        collectionPath: dataCollectionPath(uid),
        docId: docId,
        online: online,
        refresh: refresh,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<T?> doc(String uid) async {
    final online = await availableNetwork();
    final doc = await service.getFromDocument(
      collectionPath: dataCollectionPath(uid),
      docId: docId,
      online: online,
    );
    // if (!doc.exists) {
    //   return null;
    // }
    return itemMapper(doc);
  }

  Stream<T?> onDoc(String uid) async* {
    final online = await availableNetwork();
    final collection = dataCollectionPath(uid);
    final id = docId;
    yield* service
        .getSnapshotStreamFromDocument(
          collectionPath: collection,
          docId: id,
          online: online,
        )
        .map((event) =>
            // event.data() == null ? null :
            itemMapper(event));
  }
}
