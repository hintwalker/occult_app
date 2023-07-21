import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_repository.dart';

final onCountChartProvider = Provider(
  (ref) => OnCountChart(
    ref.read(chartRepositoryProvider),
  ),
);
