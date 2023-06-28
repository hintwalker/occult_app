part of lasotuvi_presentation;

abstract class AuthDependedState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  StreamSubscription? _streamSubscription;
  String? uid;
  bool findingUid = true;
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
        findingUid = false;
      });
      return user.uidInFirestore;
    }, () {
      setState(() {
        uid = null;
        findingUid = false;
      });
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
