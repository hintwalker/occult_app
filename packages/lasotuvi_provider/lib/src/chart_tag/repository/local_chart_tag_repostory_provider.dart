import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/local_chart_repository_provider.dart';
import '../../tag/repository/local_tag_repository.dart';
import '../data_source/sqlite_chart_tag_data_source_provider.dart';

final localChartTagRepositoryProvider =
    Provider.autoDispose<LocalChartTagRepositoryImpl>((ref) =>
        LocalChartTagRepositoryImpl(ref.read(sqliteChartTagDataSourceProvider),
            leftIdColumn: ColumnChartTag.chartId,
            rightIdColumn: ColumnChartTag.tagId,
            leftRepository: ref.read(localChartRepositoryProvider),
            rightRepository: ref.read(localTagRepositoryProvider)));
