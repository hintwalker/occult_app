import 'package:riverpod/riverpod.dart';
import 'package:tauari_firebase_provider/tauari_firebase_provider.dart';
import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';
import '../service/chart_firestore_service.dart';

final chartFirestoreDataSourceProvider = Provider<ChartFirestoreDataSource>(
  (ref) => ChartFirestoreDataSource(
    ref.watch(chartFirestoreServiceProvider),
    remoteFileService: ref.read(firebaseStorageServiceProvider),
    availableNetwork: availableNetwork,
  ),
);
