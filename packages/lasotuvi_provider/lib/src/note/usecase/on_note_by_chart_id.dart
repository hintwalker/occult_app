import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/note_and_chart/note_and_chart_repository.dart';

final onNoteByChartIdProvider = Provider.autoDispose<OnNoteByChartId>(
  (ref) => OnNoteByChartId(ref.read(noteAndChartRepositoryProvider)),
);
