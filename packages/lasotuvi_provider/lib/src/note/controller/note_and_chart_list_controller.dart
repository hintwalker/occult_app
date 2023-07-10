import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_note/lasotuvi_note.dart';

import '../usecase/on_note_and_chart.dart';

final noteAndChartListControllerProvider =
    ChangeNotifierProvider.autoDispose<NoteAndChartListController>((ref) =>
        NoteAndChartListController(onData: ref.read(onNoteAndChartProvider)));
