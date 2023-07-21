import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/cloud_chart_repository.dart';
import '../../data_source/firebase_request_data_source.dart';

final cloudRequestAndChartRepositoryProvider =
    Provider.autoDispose<CloudRequestAndChartRepository>(
  (ref) => CloudRequestAndChartRepositoryImpl(
      ref.read(firebaseRequestDataSourceProvider),
      ownerRepository: ref.read(cloudChartRepositoryProvider)),
);
