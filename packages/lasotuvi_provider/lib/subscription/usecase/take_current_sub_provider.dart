part of lasotuvi_provider;

final takeCurrentSubProvider = Provider.autoDispose<TakeCurrentSub>(
    (ref) => TakeCurrentSub(ref.read(currentSubRepositoryProvider)));
