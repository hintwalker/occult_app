part of lasotuvi_provider;

final removerProvider = Provider((ref) => Remover(
      deleteChartFromLocal: ref.read(deleteChartFromLocalProvider),
      deleteChartFromCloud: ref.read(deleteChartFromCloudProvider),
      deleteTagFromLocal: ref.read(deleteTagFromLocalProvider),
      deleteTagFromCloud: ref.read(deleteTagFromCloudProvider),
      deleteNoteFromLocal: ref.read(deleteNoteFromLocalProvider),
      deleteNoteFromCloud: ref.read(deleteNoteFromCloudProvider),
    ));
