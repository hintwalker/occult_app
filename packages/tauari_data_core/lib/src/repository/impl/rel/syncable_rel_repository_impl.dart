import 'package:rxdart/rxdart.dart';
import 'package:tauari_values/tauari_values.dart';

import '../../../entity/syncable_entity.dart';
import '../../../entity/syncable_entity_carrier.dart';
import '../../../model/syncable_model.dart';
import '../../../utils/only_on_local.dart';
import '../../rel/cloud_rel_repository.dart';
import '../../rel/local_rel_repository.dart';
import '../../rel/syncable_rel_repository.dart';
import '../../syncable_repository.dart';
import '../syncable_repository_impl.dart';

class SyncableRelRepositoryImpl<
        E extends SyncableEntity<E>,
        M extends SyncableModel<E>,
        L extends SyncableEntity,
        R extends SyncableEntity> extends SyncableRepositoryImpl<E, M>
    implements SyncableRelRepository<E, L, R> {
  final SyncableRepository<L> leftRepository;
  final SyncableRepository<R> rightRepository;
  final LocalRelRepository<E, L, R> localRelRepository;
  final CloudRelRepository<E, L, R> cloudRelRepository;
  SyncableRelRepositoryImpl({
    required this.cloudRelRepository,
    required this.localRelRepository,
    required this.leftRepository,
    required this.rightRepository,
  }) : super(
            localRepository: localRelRepository,
            cloudRepository: cloudRelRepository);

  /// Thực hiện kết nối giữa [L] và [R]
  ///
  /// Nếu [L] hoặc [R] chỉ có trên local thì không thực hiện kết nối trên cloud.
  @override
  Future connect({String? uid, required L left, required R right}) async {
    final id = await localRelRepository.connectOnLocal(left.id, right.id);
    if (onlyOnLocal(uid: uid, syncStatus: left.syncStatus) ||
        onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      return;
    }
    await cloudRelRepository.connectOnCloud(
      uid: uid!,
      id: id,
      leftId: left.id,
      rightId: right.id,
    );
  }

  /// Xóa dữ liệu của bảng quan hệ theo id của [L]
  ///
  /// - Việc xóa dữ liệu đầu tiên thực hiện trên local,
  /// Nếu user đã đăng nhập (uid != null) thì xóa dữ liệu trên cloud.
  /// - Vì Firebase có sử dụng chế độ offline, nên việc xóa dữ liệu trên cloud
  /// có thể thực hiện được khi không có kết nối internet.
  /// Việc xóa thực sự trên cloud sẽ được thực hiện khi có kết nối internet lại.
  @override
  Future<int> deleteByLeftId({
    required String? uid,
    required int leftId,
  }) async {
    final rows = await localRelRepository.deleteByLeftIdOnLocal(leftId);
    if (uid != null) {
      await cloudRelRepository.deleteByLeftIdOnCloud(uid, leftId);
    }
    return rows;
  }

  /// Xóa dữ liệu của bảng quan hệ theo id của [R]
  ///
  /// - Việc xóa dữ liệu đầu tiên thực hiện trên local,
  /// Nếu user đã đăng nhập (uid != null) thì xóa dữ liệu trên cloud.
  /// - Vì Firebase có sử dụng chế độ offline, nên việc xóa dữ liệu trên cloud
  /// có thể thực hiện được khi không có kết nối internet.
  /// Việc xóa thực sự trên cloud sẽ được thực hiện khi có kết nối internet lại.
  @override
  Future<int> deleteByRightId({
    required String? uid,
    required int rightId,
  }) async {
    final rows = await localRelRepository.deleteByRightIdOnLocal(rightId);
    if (uid != null) {
      await cloudRelRepository.deleteByRightIdOnCloud(uid, rightId);
    }
    return rows;
  }

  @override
  Future<Iterable<E>> byLeftId(
      String? uid, int leftId, String? syncStatus) async {
    final local = await localRelRepository.byLeftIdOnLocal(leftId);
    if (onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      return local.whereType();
    }
    final cloud = await cloudRelRepository.byLeftIdOnCloud(uid!, leftId);
    return mergeCloudToLocal(uid: uid, local: local, cloud: cloud);
  }

  @override
  Future<Iterable<E>> byRightId(
      String? uid, int rightId, String? syncStatus) async {
    final local = await localRelRepository.byRightIdOnLocal(rightId);
    if (onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      return local.whereType();
    }
    final cloud = await cloudRelRepository.byRightIdOnCloud(uid!, rightId);
    return mergeCloudToLocal(uid: uid, local: local, cloud: cloud);
  }

  @override
  Future<Iterable<L>> leftData(String? uid, R right) async {
    if (onlyOnLocal(uid: uid, syncStatus: SyncStatus.synced)) {
      final result = await localRelRepository.leftDataOnLocal(right.id);
      return result.whereType();
    }
    final relsLocal = await localRelRepository.byRightIdOnLocal(right.id);
    final leftIdsLocal = relsLocal.map((e) => localRelRepository.getLeftId(e));

    final relsCloud = await cloudRelRepository.byRightIdOnCloud(uid!, right.id);
    final leftIdsCloud = relsCloud.map((e) => cloudRelRepository.getLeftId(e));

    // final union =
    //     mergeCloudToLocal(uid: uid, local: relsLocal, cloud: relsCloud);

    final List<L> result = [];
    final unionIds = leftIdsLocal.toSet().union(leftIdsCloud.toSet());
    for (var id in unionIds) {
      final entity = await leftRepository.byId(
        uid: uid,
        docId: id,
        syncStatus: SyncStatus.synced,
      );
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
  }

  @override
  Stream<Iterable<E>> onByLeftId(String? uid, int leftId, String? syncStatus) {
    final local = localRelRepository.onByLeftIdOnLocal(leftId);
    if (onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      return local;
    }
    final cloud = cloudRelRepository.onByLeftIdOnCloud(uid!, leftId);
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Stream<Iterable<E>> onByRightId(
      String? uid, int rightId, String? syncStatus) {
    final local = localRelRepository.onByRightIdOnLocal(rightId);
    if (onlyOnLocal(uid: uid, syncStatus: syncStatus)) {
      return local;
    }
    final cloud = cloudRelRepository.onByRightIdOnCloud(uid!, rightId);
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Stream<Iterable<L>> onLeftData(String? uid, R right) {
    final local = localRelRepository
        .onLeftDataOnLocal(right.id)
        .map((event) => event.whereType<L>());
    if (onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      return local;
    }
    final cloud = cloudRelRepository
        .onLeftDataOnCloud(uid!, right.id)
        .map((event) => event.whereType<L>());
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Stream<Iterable<R>> onRightData(String? uid, L left) {
    final local = localRelRepository
        .onRightDataOnLocal(left.id)
        .map((event) => event.whereType<R>());
    if (onlyOnLocal(uid: uid, syncStatus: left.syncStatus)) {
      return local;
    }
    final cloud = cloudRelRepository
        .onRightDataOnCloud(uid!, left.id)
        .map((event) => event.whereType<R>());
    final result = Rx.combineLatest2(
      local,
      cloud,
      (a, b) => mergeCloudToLocal(uid: uid, local: a, cloud: b),
    ).asBroadcastStream(
        onCancel: (subscription) => subscription.pause(),
        onListen: (subscription) => subscription.resume());
    return result;
  }

  @override
  Future<Iterable<R>> rightData(String? uid, L left) async {
    if (onlyOnLocal(uid: uid, syncStatus: SyncStatus.synced)) {
      return await localRelRepository.rightDataOnLocal(left.id);
    }
    final relsLocal = await localRelRepository.byLeftIdOnLocal(left.id);
    final rightIdsLocal =
        relsLocal.map((e) => localRelRepository.getRightId(e));

    final relsCloud = await cloudRelRepository.byLeftIdOnCloud(uid!, left.id);
    final rightIdsCloud =
        relsCloud.map((e) => cloudRelRepository.getRightId(e));

    final unionIds = rightIdsLocal.toSet().union(rightIdsCloud.toSet());
    final List<R> result = [];
    for (var id in unionIds) {
      final entity = await rightRepository.byId(
        uid: uid,
        docId: id,
        syncStatus: SyncStatus.synced,
      );
      if (entity != null) {
        result.add(entity);
      }
    }
    return result;
  }

  /// Thực hiện ngắt kết nối giữa [L] và [R]
  ///
  /// Nếu [L] hoặc [R] chỉ có trên local thì không thực hiện ngắt kết nối trên cloud
  @override
  Future disConnect({String? uid, required L left, required R right}) async {
    await localRelRepository.disConnectOnLocal(left.id, right.id);
    if (onlyOnLocal(uid: uid, syncStatus: left.syncStatus) ||
        onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      return;
    }
    await cloudRelRepository.disConnectOnCloud(
        uid: uid!, leftId: left.id, rightId: right.id);
  }

  @override
  Stream<Iterable<SyncableEntityCarrier<R, L>>> onRightHasLeftList(
      String? uid,
      SyncableEntityCarrier<R, L> Function(R right, Iterable<L> lefts)
          onCreateItem) {
    return rightRepository
        .onEveryWhere(uid)
        .asyncMap((event) async => await Future.wait(event.map(
              (right) async {
                final lefts = await leftData(uid, right);
                return onCreateItem(right, lefts);
              },
            )));
  }

  ///
  /// Kết quả trả về là danh sách gồm 1 đối tượng [L] và nhiều đối tượng [R]
  /// Đối tượng [L] được lấy từ stream, nên mọi thay đổi trên [L] sẽ được cập nhật.
  /// Trong khi mỗi đối tượng [R] được lấy từ Future, nên những thay đổi trên [R]
  /// sẽ không được cập nhật.
  ///
  @override
  Stream<Iterable<SyncableEntityCarrier<L, R>>> onLeftHasRightList(
      String? uid,
      SyncableEntityCarrier<L, R> Function(L left, Iterable<R> rights)
          onCreateItem) {
    return leftRepository
        .onEveryWhere(uid)
        // .asyncMap((event) async {
        //   final rightsFuture = event.map((left) => rightData(uid, left.id));
        //   final List<EntityCarrier<L, R>> result = [];
        //   for (var future in rightsFuture) {
        //     final rights = await future;
        //     result.add(onCreateItem(left, rights));
        //   }
        // });
        .asyncMap((event) async => await Future.wait(event.map(
              (left) async {
                final rights = await rightData(uid, left);
                return onCreateItem(left, rights);
              },
            )));
    // return onCreateItem(left, rights);
  }

  @override
  Stream<SyncableEntityCarrier<L, R>?> onLeftHasRight(
      {required String? uid,
      required L left,
      required SyncableEntityCarrier<L, R> Function(L p1, Iterable<R> p2)
          onCreateItem}) {
    return leftRepository
        .onById(
      uid: uid,
      docId: left.id,
      syncStatus: left.syncStatus,
    )
        .asyncMap((event) async {
      if (event == null) {
        return Future.value(null);
      }
      final rights = await rightData(uid, event);
      return onCreateItem(event, rights);
    });
  }

  /// Tìm đối tượng gồm [R] cho trước chứa theo tất các [L]
  ///
  /// Nếu [R] chỉ có trên local thì chỉ tìm đối tượng trên local,
  /// các [L] thì tìm cả trên local và cloud.
  @override
  Stream<SyncableEntityCarrier<R, L>?> onRightHasLeft(
      {required String? uid,
      required R right,
      required SyncableEntityCarrier<R, L> Function(R p1, Iterable<L> p2)
          onCreateItem}) {
    return rightRepository
        .onById(
      uid: uid,
      docId: right.id,
      syncStatus: SyncStatus.synced,
    )
        .asyncMap((event) async {
      if (event == null) {
        return Future.value(null);
      }
      final lefts = await leftData(uid, event);
      return onCreateItem(event, lefts);
    });
  }

  @override
  Future<void> connectLeftToRight({
    required String? uid,
    required R right,
    required Iterable<L> lefts,
  }) async {
    List<int> ids = [];
    ids = await localRelRepository.connectManyLeftToRight(right, lefts);
    if (!onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      await cloudRelRepository.connectManyLeftToRight(
        uid: uid!,
        ids: ids,
        right: right,
        lefts: lefts,
      );
    }
  }

  @override
  Future<void> disConnectLeftFromRight({
    required String? uid,
    required R right,
    required Iterable<L> lefts,
  }) async {
    await localRelRepository.disConnectManyLeftFromRight(right, lefts);

    if (!onlyOnLocal(uid: uid, syncStatus: right.syncStatus)) {
      await cloudRelRepository.disConnectManyLeftFromRight(
        uid: uid!,
        right: right,
        lefts: lefts,
      );
    }
  }

  /// Thực hiện kết nối nhiều [R] vào 1 [L]
  ///
  /// Nếu L chỉ có trên local thì chỉ thực hiện kết nối trên local
  @override
  Future<void> connectRightToLeft({
    required String? uid,
    required L left,
    required Iterable<R> rights,
  }) async {
    List<int> ids = [];

    ids = await localRelRepository.connectManyRightToLeft(left, rights);
    if (!onlyOnLocal(uid: uid, syncStatus: left.syncStatus)) {
      await cloudRelRepository.connectManyRightToLeft(
        uid: uid!,
        ids: ids,
        left: left,
        rights: rights,
      );
    }
  }

  @override
  Future<void> disConnectRightFromLeft({
    required String? uid,
    required L left,
    required Iterable<R> rights,
  }) async {
    await localRelRepository.disConnectManyRightFromLeft(left, rights);
    if (!onlyOnLocal(uid: uid, syncStatus: left.syncStatus)) {
      await cloudRelRepository.disConnectManyRightFromLeft(
        uid: uid!,
        left: left,
        rights: rights,
      );
    }
  }
}
