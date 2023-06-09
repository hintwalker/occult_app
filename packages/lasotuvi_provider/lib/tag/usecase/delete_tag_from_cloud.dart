part of lasotuvi_provider;

final deleteTagFromCloudProvider = Provider.autoDispose<DeleteTagFromCloud>(
  (ref) => DeleteTagFromCloud(ref.read(cloudTagRepositoryProvider)),
);
