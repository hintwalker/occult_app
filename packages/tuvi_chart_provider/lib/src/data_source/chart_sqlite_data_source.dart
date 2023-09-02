import 'package:riverpod/riverpod.dart';
import 'package:tuvi_chart_data/tuvi_chart_data.dart';

import '../dao/chart_dao.dart';

final chartSqliteDataSourceProvider =
    Provider.autoDispose<ChartSqliteDataSource>(
  (ref) => ChartSqliteDataSource(
    ref.read(chartDaoProvider),
  ),
);
