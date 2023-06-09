part of lasotuvi_provider;

final onTagsProvider = Provider.autoDispose<OnTags>(
    (ref) => OnTags(ref.read(tagRepositoryProvider)));
