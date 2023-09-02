import 'package:riverpod/riverpod.dart';
import 'package:tauari_local_database_provider/tauari_local_database_provider.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';

final chartDaoProvider = Provider.autoDispose<ChartDao>(
  (ref) => ChartDao(
    ref.read(localDatabaseProvider),
  ),
);
