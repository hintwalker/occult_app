import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/storage_plan/data_source/storage_plan_firestore_data_source.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../data_source/storage_plan_cache_data_source.dart';

final storagePlanCacheRepositoryProvider = Provider<StoragePlanRepositoryImpl>(
  (ref) => StoragePlanRepositoryImpl(
    ref.read(storagePlanCacheDataSourceProvider),
    onlineDataSource: ref.read(storagePlanFirestoreDataSourceProvider),
  ),
);
