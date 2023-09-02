import 'package:riverpod/riverpod.dart';
import 'package:tauari_firebase_provider/tauari_firebase_provider.dart';
import 'package:tauari_utils/tauari_utils.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';

final chartFirestoreServiceProvider = Provider(
  (ref) => ChartFirestoreService(
    ref.read(firebaseFirestoreProvider),
    availableNetwork: availableNetwork,
  ),
);
