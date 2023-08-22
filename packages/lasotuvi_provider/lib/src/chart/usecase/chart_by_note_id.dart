import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../note/repository/note_and_chart/note_and_chart_cache_repository.dart';

final chartByNoteIdProvider = Provider.autoDispose<ChartByNoteId>(
  (ref) => ChartByNoteId(ref.read(noteAndChartCacheRepositoryProvider)),
);
