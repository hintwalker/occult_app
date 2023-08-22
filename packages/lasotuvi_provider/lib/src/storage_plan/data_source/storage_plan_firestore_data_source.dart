import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import '../../utils/check_network_status.dart';
import '../service/storage_plan_firestore_service.dart';

final storagePlanFirestoreDataSourceProvider =
    Provider.autoDispose<StoragePlanCloudDataSource>(
  (ref) => StoragePlanFirestoreDataSource(
    ref.read(storagePlanFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
