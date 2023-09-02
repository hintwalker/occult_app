import 'package:riverpod/riverpod.dart';
import 'package:tauari_firebase_provider/tauari_firebase_provider.dart';
import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';
import '../service/chart_cache_service.dart';

final chartCacheDataSourceProvider = Provider(
  (ref) => ChartCacheDataSource(
    ref.watch(chartCacheServiceProvider),
    remoteFileService: ref.read(firebaseStorageServiceProvider),
    availableNetwork: availableNetwork,
  ),
);
