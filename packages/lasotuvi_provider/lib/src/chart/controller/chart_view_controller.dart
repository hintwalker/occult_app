import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_provider/src/request/usecase/on_request_by_chart_id.dart';

import '../../chart_tag/usecase/on_chart_has_tags.dart';
// import '../../commentary/usecase/on_commentary_by_request_id.dart';
import '../../note/usecase/on_note_by_chart_id.dart';

final chartViewControllerProvider =
    ChangeNotifierProvider.autoDispose<ChartViewController>(
  (ref) => ChartViewController(
    onData: ref.read(onChartHasTagsProvider),
    onNotes: ref.read(
      onNoteByChartIdProvider,
    ),
    onRequestByChartId: ref.read(onRequestByChartIdProvider),
    // onCommentaries: ref.read(onCommentaryByChartIdProvider),
  ),
);
