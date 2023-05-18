part of lasotuvi_provider;

final currentSubControllerProvider = ChangeNotifierProvider(
    (ref) => CurrentSubController(ref.read(onCurrentSubProvider)));
