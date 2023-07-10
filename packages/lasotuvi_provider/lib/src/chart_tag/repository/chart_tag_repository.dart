import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../chart/repository/chart_repository_provider.dart';
import '../../tag/repository/tag_repository.dart';
import 'cloud_chart_tag_repository.dart';
import 'local_chart_tag_repostory_provider.dart';

final chartTagRepositoryProvider = Provider.autoDispose<ChartTagRepositoryImpl>(
  (ref) => ChartTagRepositoryImpl(
      localRelRepository: ref.read(localChartTagRepositoryProvider),
      cloudRelRepository: ref.read(cloudChartTagRepositoryProvider),
      leftRepository: ref.read(chartRepositoryProvider),
      rightRepository: ref.read(tagRepositoryProvider)),
);
