import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_chart_repository_provider.dart';

final insertChartToLocalProvider = Provider.autoDispose<InsertChartToLocal>(
  (ref) => InsertChartToLocal(ref.read(localChartRepositoryProvider)),
);
