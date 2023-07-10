import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../data_source/storage_plan_data_source_provider.dart';

final storagePlanRepositoryProvider =
    Provider.autoDispose<StoragePlanRepositoryImpl>((ref) =>
        StoragePlanRepositoryImpl(ref.read(storagePlanDataSourceProvider)));
