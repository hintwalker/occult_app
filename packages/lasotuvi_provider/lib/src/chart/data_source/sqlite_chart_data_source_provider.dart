import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/chart_dao_provider.dart';

final sqliteChartDataSourceProvider =
    Provider.autoDispose<SqliteChartDataSource>(
  (ref) => SqliteChartDataSource(ref.read(chartDaoProvider)),
);
