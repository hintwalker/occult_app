part of lasotuvi_provider;

final noteAndChartListControllerProvider =
    ChangeNotifierProvider.autoDispose<NoteAndChartListController>((ref) =>
        NoteAndChartListController(onData: ref.read(onNoteAndChartProvider)));
