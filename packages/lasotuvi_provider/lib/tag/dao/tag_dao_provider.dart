part of lasotuvi_provider;

final tagDaoProvider = Provider.autoDispose<TagDao>(
    (ref) => TagDao(ref.read(localDatabaseProvider)));
