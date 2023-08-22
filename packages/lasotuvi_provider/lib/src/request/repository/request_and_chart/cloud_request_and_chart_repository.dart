import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/chart_cloud_cache_repository.dart';
import '../../data_source/request_cache_data_source.dart';
import '../../data_source/request_firestore_data_source.dart';

final cloudRequestAndChartRepositoryProvider =
    Provider.autoDispose<CloudRequestAndChartRepository>(
  (ref) => ReqChartCloudRepositoryImpl(ref.read(requestCacheDataSourceProvider),
      onlineDataSource: ref.read(requestFirestoreDataSourceProvider),
      ownerRepository: ref.read(chartCloudCacheRepositoryProvider)),
);
