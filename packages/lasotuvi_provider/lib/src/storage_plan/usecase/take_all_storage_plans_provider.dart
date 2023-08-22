import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../repository/storage_plan_cache_repository.dart';

final takeAllStoragePlansProvider = Provider.autoDispose<TakeAllStoragePlans>(
    (ref) => TakeAllStoragePlans(ref.read(storagePlanCacheRepositoryProvider)));
