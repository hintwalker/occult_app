import 'package:tauari_values/tauari_values.dart';

import 'set_of_entity.dart';
import 'syncable.dart';

class PoolSetOfEntity<T extends Syncable> {
  final SetOfEntity<T> localSet;
  final SetOfEntity<T> cloudSet;
  const PoolSetOfEntity(this.localSet, this.cloudSet);

  SetOfEntity<T> solveKeepLocal() {
    final result = <T>[];
    for (var localItem in localSet.items) {
      try {
        final cloudItem = cloudSet.items.firstWhere(
          (element) => element.syncId == localItem.syncId,
        );
        if (localItem.getModified > cloudItem.getModified) {
          result.add(localItem.copyWithSyncStatus(SyncStatus.synced));
        } else {
          result.add(cloudItem.copyWithSyncStatus(SyncStatus.synced));
        }
      } on StateError catch (_) {
        result.add(localItem.copyWithSyncStatus(SyncStatus.onlyLocal));
      }
    }
    result.addAll(_justOnCloud().toList());
    return SetOfEntity<T>.fromList(result);
    // return _justOnLocal().union(_synced()).union(_justOnCloud());
  }

  SetOfEntity<T> solveKeepCloud() {
    return _justOnCloud().union(_synced()).union(_justOnLocal());
  }

  SetOfEntity<T> _synced() {
    final intersection = localSet.intersection(cloudSet);
    return intersection.updateOnCloud(SyncStatus.synced);
  }

  SetOfEntity<T> _justOnCloud() {
    final diffOnB = cloudSet.difference(localSet);
    return diffOnB.updateOnCloud(SyncStatus.onlyCloud);
  }

  SetOfEntity<T> _justOnLocal() {
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
