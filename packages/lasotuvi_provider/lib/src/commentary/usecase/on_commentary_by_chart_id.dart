import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/commentary_and_chart/commentary_and_chart_repository.dart';

final onCommentaryByChartIdProvider =
    Provider.autoDispose<OnCommentaryByChartId>(
  (ref) =>
      OnCommentaryByChartId(ref.read(commentaryAndChartRepositoryProvider)),
);
