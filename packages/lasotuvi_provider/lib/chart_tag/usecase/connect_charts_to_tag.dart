part of lasotuvi_provider;

final connectChartsToTagProvider = Provider.autoDispose<ConnectChartsToTag>(
  (ref) => ConnectChartsToTag(ref.read(chartTagRepositoryProvider)),
);
