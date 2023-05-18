part of lasotuvi_presentation;

abstract class AuthDependedState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  StreamSubscription? _streamSubscription;
  String? uid;
  @override
  void initState() {
    super.initState();
    startListening();
  }

  void startListening() {
    _streamSubscription =
        ref.read(registerOnAuthStateChangedProvider).call((user) {
      setState(() {
        uid = user.uidInFirestore;
      });
      return user.uidInFirestore;
    }, () {
      setState(() {
        uid = null;
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
