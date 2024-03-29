import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_and_chart/note_and_chart_cache_repository.dart';

final onNoteAndChartProvider = Provider.autoDispose<OnNoteAndChart>(
  (ref) =>
      OnNoteAndChart(repository: ref.read(noteAndChartCacheRepositoryProvider)),
);
