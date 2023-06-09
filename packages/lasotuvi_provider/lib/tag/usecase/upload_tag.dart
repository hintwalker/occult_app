part of lasotuvi_provider;

final uploadTagProvider = Provider.autoDispose<UploadTag>(
  (ref) => UploadTag(ref.read(tagRepositoryProvider)),
);
