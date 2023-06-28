part of lasotuvi_provider;

final noteAndChartListControllerProvider =
    ChangeNotifierProvider<NoteAndChartListController>((ref) =>
        NoteAndChartListController(onData: ref.read(onNoteAndChartProvider)));
