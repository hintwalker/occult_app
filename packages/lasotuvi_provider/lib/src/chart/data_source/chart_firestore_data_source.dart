import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../cloud_service/firebase_storage_service.dart';
import '../../utils/check_network_status.dart';
import '../service/chart_firestore_service.dart';

final chartFirestoreDataSourceProvider = Provider<ChartFirestoreDataSource>(
  (ref) => ChartFirestoreDataSource(
    ref.watch(chartFirestoreServiceProvider),
    remoteFileService: ref.read(firebaseStorageServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
