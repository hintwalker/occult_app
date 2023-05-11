part of lasotuvi_presentation;

final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifer, bool>(
  () => RouterNotifer(),
);
