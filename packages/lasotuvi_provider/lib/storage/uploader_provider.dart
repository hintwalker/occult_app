part of lasotuvi_provider;

final uploaderProvider = Provider<Uploader>((ref) => Uploader(
    uploadChart: ref.read(uploadChartProvider),
    uploadTag: ref.read(uploadTagProvider),
    uploadNote: ref.read(
      uploadNoteProvider,
    )));
