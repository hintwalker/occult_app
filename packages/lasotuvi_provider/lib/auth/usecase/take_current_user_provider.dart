part of lasotuvi_provider;

final takeCurrentUserProvider = Provider.autoDispose<TakeCurrentUser>(
  (ref) => TakeCurrentUser(ref.read(authRepositoryProvider)),
);
