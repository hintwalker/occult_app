import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_provider/src/utils/check_network_status.dart';
import '../service/chart_tag_firestore_service.dart';

final chartTagFirestoreDataSourceProvider =
    Provider.autoDispose<ChartTagFirestoreDataSource>(
  (ref) => ChartTagFirestoreDataSource(
    ref.read(chartTagFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
