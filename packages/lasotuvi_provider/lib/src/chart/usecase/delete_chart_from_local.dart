import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_chart_repository_provider.dart';

final deleteChartFromLocalProvider = Provider.autoDispose<DeleteChartFromLocal>(
  (ref) => DeleteChartFromLocal(ref.read(localChartRepositoryProvider)),
);
