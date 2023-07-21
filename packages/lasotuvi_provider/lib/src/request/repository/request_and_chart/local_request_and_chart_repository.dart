import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/local_chart_repository.dart';
import '../../data_source/sqlite_request_data_source.dart';

final localRequestAndChartRepositoryProvider =
    Provider.autoDispose<LocalRequestAndChartRepository>(
  (ref) => LocalRequestAndChartRepositoryImpl(
      ref.read(sqliteRequestDataSourceProvider),
      ownerRepository: ref.read(localChartRepositoryProvider)),
);
