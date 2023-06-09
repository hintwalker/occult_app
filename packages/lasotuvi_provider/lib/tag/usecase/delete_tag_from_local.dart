part of lasotuvi_provider;

final deleteTagFromLocalProvider = Provider.autoDispose<DeleteTagFromLocal>(
  (ref) => DeleteTagFromLocal(ref.read(localTagRepositoryProvider)),
);
