part of lasotuvi_provider;

final setUserProvider = Provider.autoDispose<SetUser>(
    (ref) => SetUser(ref.read(userRepositoryProvider)));
