import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/cloud_chart_repository.dart';

final deleteChartFromCloudProvider = Provider.autoDispose<DeleteChartFromCloud>(
  (ref) => DeleteChartFromCloud(ref.read(cloudChartRepositoryProvider)),
);
