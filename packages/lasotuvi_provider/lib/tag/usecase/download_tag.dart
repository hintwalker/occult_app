part of lasotuvi_provider;

final downloadTagProvider = Provider.autoDispose<DownloadTag>(
  (ref) => DownloadTag(ref.read(tagRepositoryProvider)),
);
