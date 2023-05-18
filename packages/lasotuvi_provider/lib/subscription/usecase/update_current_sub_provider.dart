part of lasotuvi_provider;

final updateCurrentSubProvider = Provider.autoDispose<UpdateCurrentSub>(
    (ref) => UpdateCurrentSub(ref.read(currentSubRepositoryProvider)));
