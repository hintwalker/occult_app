import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_repository.dart';

final updateChartProvider = Provider.autoDispose<UpdateChart>(
  (ref) => UpdateChart(
    ref.read(chartRepositoryProvider),
  ),
);
