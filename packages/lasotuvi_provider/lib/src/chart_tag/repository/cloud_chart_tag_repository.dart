import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/cloud_chart_repository_provider.dart';
import '../../tag/repository/cloud_tag_repository.dart';
import '../data_source/firebase_chart_tag_data_source.dart';

final cloudChartTagRepositoryProvider =
    Provider.autoDispose<CloudChartTagRepositoryImpl>(
  (ref) => CloudChartTagRepositoryImpl(
      ref.read(firebaseChartTagDataSourceProvider),
      leftIdColumn: ColumnChartTag.chartId,
      rightIdColumn: ColumnChartTag.tagId,
      leftRepository: ref.read(cloudChartRepositoryProvider),
      rightRepository: ref.read(cloudTagRepositoryProvider)),
);
