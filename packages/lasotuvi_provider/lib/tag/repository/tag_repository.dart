part of lasotuvi_provider;

final tagRepositoryProvider = Provider.autoDispose<TagRepositoryImpl>(
  (ref) => TagRepositoryImpl(
      localRepository: ref.read(localTagRepositoryProvider),
      cloudRepository: ref.read(cloudTagRepositoryProvider)),
);
