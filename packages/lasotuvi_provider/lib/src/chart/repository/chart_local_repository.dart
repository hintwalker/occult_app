import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/chart_sqlite_data_source.dart';

final chartLocalRepositoryProvider = Provider<ChartLocalRepository>(
  (ref) => ChartLocalRepositoryImpl(ref.read(chartSqliteDataSourceProvider)),
);
