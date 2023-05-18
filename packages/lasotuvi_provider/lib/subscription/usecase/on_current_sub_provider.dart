part of lasotuvi_provider;

final onCurrentSubProvider = Provider.autoDispose<OnCurrentSub>(
    (ref) => OnCurrentSub(ref.read(currentSubRepositoryProvider)));
