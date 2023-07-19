import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../commentary/repository/commentary_and_chart/commentary_and_chart_repository.dart';

final chartByCommentaryIdProvider = Provider.autoDispose<ChartByCommentaryId>(
  (ref) => ChartByCommentaryId(ref.read(commentaryAndChartRepositoryProvider)),
);
