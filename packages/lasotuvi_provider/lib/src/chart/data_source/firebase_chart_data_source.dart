import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../cloud_service/firebase_storage_service.dart';
import '../../cloud_service/firestore_service_provider.dart';

final firebaseChartDataSourceProvider = Provider<FirebaseChartDataSource>(
  (ref) => FirebaseChartDataSource(ref.watch(firestoreServiceProvider),
      remoteFileService: ref.read(firebaseStorageServiceProvider)),
);
