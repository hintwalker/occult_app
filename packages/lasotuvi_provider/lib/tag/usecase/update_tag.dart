part of lasotuvi_provider;

final updateTagProvider = Provider.autoDispose<UpdateTag>(
  (ref) => UpdateTag(ref.read(tagRepositoryProvider)),
);
