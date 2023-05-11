part of lasotuvi_provider;

final setupInitUserProvider = Provider.autoDispose<SetupInitUser>(
    (ref) => SetupInitUser(ref.read(userRepositoryProvider)));
