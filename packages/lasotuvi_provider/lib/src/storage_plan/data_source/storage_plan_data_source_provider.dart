import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../../cloud_service/firestore_service_provider.dart';

final storagePlanDataSourceProvider =
    Provider.autoDispose<FirebaseStoragePlanDataSource>((ref) =>
        FirebaseStoragePlanDataSource(ref.read(firestoreServiceProvider)));
