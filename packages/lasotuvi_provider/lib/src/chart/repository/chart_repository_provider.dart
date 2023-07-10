import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import 'cloud_chart_repository_provider.dart';
import 'local_chart_repository_provider.dart';

final chartRepositoryProvider = Provider.autoDispose((ref) =>
    ChartRepositoryImpl(
        localRepository: ref.read(localChartRepositoryProvider),
        cloudRepository: ref.read(cloudChartRepositoryProvider)));
