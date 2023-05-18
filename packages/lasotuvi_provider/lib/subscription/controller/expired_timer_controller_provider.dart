part of lasotuvi_provider;

final expiredTimerControllerProvider =
    ChangeNotifierProvider<ExpiredTimerController>(
        (ref) => ExpiredTimerController(ref.read(updateCurrentSubProvider)));
