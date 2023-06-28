part of lasotuvi_provider;

final insertTagToLocalProvider = Provider.autoDispose<InsertTagToLocal>(
  (ref) => InsertTagToLocal(ref.read(localTagRepositoryProvider)),
);
