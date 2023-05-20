part of lasotuvi_provider;

final updateCurrentSubProvider = Provider<UpdateCurrentSub>(
    (ref) => UpdateCurrentSub(ref.read(currentSubRepositoryProvider)));
