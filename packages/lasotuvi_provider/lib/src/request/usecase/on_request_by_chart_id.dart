import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/request_and_chart/request_and_chart_repository.dart';

final onRequestByChartIdProvider = Provider.autoDispose<OnRequestByChartId>(
  (ref) => OnRequestByChartId(ref.read(requestAndChartRepositoryProvider)),
);
