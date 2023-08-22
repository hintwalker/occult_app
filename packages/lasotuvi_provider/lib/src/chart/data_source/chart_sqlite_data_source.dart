import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/chart_dao.dart';

final chartSqliteDataSourceProvider =
    Provider.autoDispose<ChartSqliteDataSource>(
  (ref) => ChartSqliteDataSource(ref.read(chartDaoProvider)),
);
