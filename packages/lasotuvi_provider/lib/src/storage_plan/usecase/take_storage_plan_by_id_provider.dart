import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../repository/storage_plan_repository_provider.dart';

final takeStoragePlanByIdProvider = Provider.autoDispose<TakeStoragePlanById>(
    (ref) => TakeStoragePlanById(ref.read(storagePlanRepositoryProvider)));
