import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_repository_provider.dart';

final onChartsProvider = Provider.autoDispose<OnCharts>(
    (ref) => OnCharts(ref.read(chartRepositoryProvider)));
