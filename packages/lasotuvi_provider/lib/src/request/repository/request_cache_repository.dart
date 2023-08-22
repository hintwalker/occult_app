import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_cache_repository.dart';
import 'request_cloud_cache_repository.dart';
import 'local_request_repository.dart';

final requestCacheRepositoryProvider = Provider.autoDispose<RequestRepository>(
  (ref) => RequestRepositoryImpl(
      localDependentRepository: ref.read(localRequestRepositoryProvider),
      cloudDependentRepository: ref.read(requestCloudCacheRepositoryProvider),
      ownerRepository: ref.read(chartCacheRepositoryProvider)),
);
