part of lasotuvi_provider;

final tagListControllerProvider =
    ChangeNotifierProvider.autoDispose<TagListController>(
        (ref) => TagListController(onData: ref.read(onTagsProvider)));
