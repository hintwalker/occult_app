import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import 'cloud_chart_repository.dart';
import 'local_chart_repository.dart';

final chartRepositoryProvider = Provider((ref) => ChartRepositoryImpl(
    localRepository: ref.watch(localChartRepositoryProvider),
    cloudRepository: ref.watch(cloudChartRepositoryProvider)));
