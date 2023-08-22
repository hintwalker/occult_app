import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_local_repository.dart';

final insertChartToLocalProvider = Provider.autoDispose<InsertChartToLocal>(
  (ref) => InsertChartToLocal(ref.read(chartLocalRepositoryProvider)),
);
