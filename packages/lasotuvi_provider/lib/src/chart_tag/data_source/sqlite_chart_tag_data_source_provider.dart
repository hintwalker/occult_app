import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/chart_tag_dao_provider.dart';

final sqliteChartTagDataSourceProvider =
    Provider.autoDispose<SqliteChartTagDataSource>(
  (ref) => SqliteChartTagDataSource(ref.read(chartTagDaoProvider)),
);
