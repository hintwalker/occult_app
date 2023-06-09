part of tauari_data_core;

class PoolSetOfEntity<T extends Syncable> {
  final SetOfEntity<T> localSet;
  final SetOfEntity<T> cloudSet;
  const PoolSetOfEntity(this.localSet, this.cloudSet);

  SetOfEntity<T> solve() {
    return justOnLocal().union(synced()).union(justOnCloud());
  }

  SetOfEntity<T> synced() {
    final intersection = localSet.intersection(cloudSet);
    return intersection.updateOnCloud(SyncStatus.synced);
  }

  SetOfEntity<T> justOnCloud() {
    final diffOnB = cloudSet.difference(localSet);
    return diffOnB.updateOnCloud(SyncStatus.onlyCloud);
  }

  SetOfEntity<T> justOnLocal() {
    final diffOnB = localSet.difference(cloudSet);
    return diffOnB.updateOnCloud(SyncStatus.onlyLocal);
  }

  // Map<String, Object?> dump() {
  //   // var localMap = {};
  //   // for (var i = 0; i < localSet.length; i++) {
  //   //   final element = localSet[i];
  //   //   localMap.addAll({element.id.toString(): element.toMap()});
  //   // }
  //   // var cloudMap = {};
  //   // for (var i = 0; i < cloudSet.length; i++) {
  //   //   final element = cloudSet[i];
  //   //   cloudMap.addAll({element.id.toString(): element.toMap()});
  //   // }
  //   return {'local': localSet.dump(), 'cloud': cloudSet.dump()};
  // }
}
