import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/sqlite_chart_data_source.dart';

final localChartRepositoryProvider = Provider.autoDispose<LocalChartRepository>(
  (ref) => LocalChartRepositoryImpl(ref.read(sqliteChartDataSourceProvider)),
);
