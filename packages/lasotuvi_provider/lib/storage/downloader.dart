part of lasotuvi_provider;

final downloaderProvider = Provider<Downloader>((ref) => Downloader(
    downloadChart: ref.read(downloadChartProvider),
    downloadTag: ref.read(downloadTagProvider),
    downloadNote: ref.read(downloadNoteProvider)));
