part of lasotuvi_provider;

final tagDetailControllerProvider = Provider<TagDetailController>(
  (ref) => TagDetailController(onData: ref.read(onTagHasChartsProvider)),
);
