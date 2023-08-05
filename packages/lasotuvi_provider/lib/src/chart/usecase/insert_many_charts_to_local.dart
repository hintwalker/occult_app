import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_chart_repository.dart';

final insertManyChartsToLocalProvider =
    Provider.autoDispose<InsertManyChartsToLocal>(
  (ref) => InsertManyChartsToLocal(ref.read(localChartRepositoryProvider)),
);
