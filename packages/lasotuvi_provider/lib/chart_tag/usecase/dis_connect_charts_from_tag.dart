part of lasotuvi_provider;

final disConnectChartsFromTagProvider =
    Provider.autoDispose<DisConnectChartsFromTag>(
  (ref) => DisConnectChartsFromTag(ref.read(chartTagRepositoryProvider)),
);
