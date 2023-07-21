import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/chart_repository.dart';
import 'cloud_request_and_chart_repository.dart';
import 'local_request_and_chart_repository.dart';

final requestAndChartRepositoryProvider =
    Provider.autoDispose<RequestAndChartRepository>(
  (ref) => RequestAndChartRepositoryImpl(
      localDependentRepository:
          ref.read(localRequestAndChartRepositoryProvider),
      cloudDependentRepository:
          ref.read(cloudRequestAndChartRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
