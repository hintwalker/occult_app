import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

import '../data_source/chart_sqlite_data_source.dart';

final chartLocalRepositoryProvider = Provider<ChartLocalRepository>(
  (ref) => ChartLocalRepositoryImpl(ref.read(chartSqliteDataSourceProvider)),
);
