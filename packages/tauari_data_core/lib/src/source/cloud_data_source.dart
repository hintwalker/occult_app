import 'dart:async';

import '../model/cloud_model.dart';
import '../query/query_args.dart';
import '../service/cloud_service.dart';
import 'no_sql_data_source.dart';

abstract class CloudDataSource<T extends CloudModel>
    implements NoSqlDataSource {
  CloudDataSource(
    this.service, {
    required this.itemMapper,
    required this.listMapper,
    required this.availableNetwork,
  });
  final CloudService service;
  final T? Function(dynamic) itemMapper;
  final Iterable<T> Function(dynamic) listMapper;
  final FutureOr<bool> Function() availableNetwork;
  // final T Function(DocumentSnapshot<Object?>) itemMapper;
  // final Iterable<T> Function(QuerySnapshot<Object?>) listMapper;
  // String dataCollectionPath(String uid);
  Future<bool> insert(
    String uid,
    T item,
    bool refresh,
  ) async {
    final idString = item.docId;
    try {
      await service.setToCollection(
        key: idString,
        data: item.toCloud(),
        collectionPath: dataCollectionPath(uid),
        refresh: refresh,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> update(
    String uid,
    T item,
    bool refresh,
  ) =>
      insert(uid, item, refresh);

  Future<bool> exist(String uid, String docId) async {
    final online = await availableNetwork();
    return await service.exists(
      collectionPath: dataCollectionPath(uid),
      docId: docId,
      online: online,
    );
  }

  Future<bool> delete(
    String uid,
    String docId,
    bool refresh,
  ) async {
    final online = await availableNetwork();
    try {
      return await service.deleteDocumentFromCollection(
        collectionPath: dataCollectionPath(uid),
        docId: docId,
        online: online,
        refresh: refresh,
      );
    } catch (e) {
      return false;
    }
  }

  Future<Iterable<String>> deleteWhere(
    String uid,
    QueryArgs queryArgs,
    bool refresh,
  ) async {
    final list = await data(uid, queryArgs);
    for (var item in list) {
      await delete(uid, item.docId, refresh);
    }
    return list.map((e) => e.docId);
  }

  Future<T?> byId(String uid, String docId) async {
    final collection = dataCollectionPath(uid);
    final online = await availableNetwork();
    final doc = await service.getFromDocument(
      collectionPath: collection,
      docId: docId,
      online: online,
    );
    // if (!doc.exists) {
    //   return null;
    // }
    final data = itemMapper(doc);
    return data;
  }

  Stream<int> onCount(String uid) {
    return service.countDocuments(dataCollectionPath(uid));
  }

  Future<Iterable<T>> data(String uid, [QueryArgs? queryArgs]) async {
    final list = await service.getFromCollection(
      collectionPath: dataCollectionPath(uid),
      where: queryArgs?.firestoreWhere,
      orderBy: queryArgs?.firestoreOrderBy,
      limit: queryArgs?.limitCloud,
    );
    return listMapper(list);
    // return await service
    //     .getSnapshotStreamFromCollection(
    //       collectionPath: dataCollectionPath(uid),
    //       limit: queryArgs?.limit,
    //       where: queryArgs?.firestoreWhere,
    //       orderBy: queryArgs?.firestoreOrderBy,
    //     )
    //     .map((list) => listMapper(list))
    //     .timeout(const Duration(seconds: 4), onTimeout: (controller) {
    //   controller.close();
    // }).last;
  }

  Stream<Iterable<T>> onData(String uid, [QueryArgs? queryArgs]) {
    return service
        .getSnapshotStreamFromCollection(
          collectionPath: dataCollectionPath(uid),
          limit: queryArgs?.limitCloud,
          where: queryArgs?.firestoreWhere,
          orderBy: queryArgs?.firestoreOrderBy,
        )
        .map((list) => listMapper(list));
  }

  Stream<T?> onById(String uid, String docId) async* {
    final online = await availableNetwork();
    yield* service
        .getSnapshotStreamFromDocument(
          collectionPath: dataCollectionPath(uid),
          docId: docId,
          online: online,
        )
        .map((event) => itemMapper(
            event)); //event.data() == null ? null : itemMapper(event));
  }

  void refresh() => service.triggerUpdate();
}
