import 'package:tauari_data_core/tauari_data_core.dart';

import '../../entity/storage_plan.dart';
import '../../model/storage_plan_model.dart';
import '../storage_plan_repository.dart';

class StoragePlanRepositoryImpl
    extends CloudRepositoryImpl<StoragePlan, StoragePlanModel>
    implements StoragePlanRepository {
  StoragePlanRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
  }) : super(entityToModel: (e) => StoragePlanModel.fromEntity(e));
}
