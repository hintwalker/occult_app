part of lasotuvi_provider;

final syncTagsProvider = Provider.autoDispose<SyncTags>(
  (ref) => SyncTags(ref.read(tagRepositoryProvider)),
);
