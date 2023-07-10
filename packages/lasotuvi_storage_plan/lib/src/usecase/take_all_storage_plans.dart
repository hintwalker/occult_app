import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/storage_plan.dart';
import '../repository/storage_plan_repository.dart';

class TakeAllStoragePlans {
  final StoragePlanRepository repository;
  const TakeAllStoragePlans(this.repository);
  Future<Iterable<StoragePlan>> call(String? uid,
          [QueryArgs? queryArgs]) async =>
      uid == null ? [] : await repository.dataCloud(uid, queryArgs);
}
