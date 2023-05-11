part of lasotuvi_provider;

final currentUserStreamProvider = StreamProvider.autoDispose((ref) {
  final controller = StreamController<UserEntity?>.broadcast();
  final sub = ref.watch(authRepositoryProvider).onCurrentUser().listen((event) {
    controller.add(event);
  });
  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });
  return controller.stream;
});
