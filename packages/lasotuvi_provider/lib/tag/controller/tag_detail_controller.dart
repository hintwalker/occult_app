part of lasotuvi_provider;

final tagDetailControllerProvider =
    ChangeNotifierProvider.autoDispose<TagDetailController>(
  (ref) => TagDetailController(onData: ref.read(onTagHasChartsProvider)),
);
