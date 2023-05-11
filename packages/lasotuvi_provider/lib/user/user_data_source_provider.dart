part of lasotuvi_provider;

final userDataSourceProvider = Provider.autoDispose<UserDataSource>(
    (ref) => UserDataSource(ref.read(firestoreServiceProvider)));
