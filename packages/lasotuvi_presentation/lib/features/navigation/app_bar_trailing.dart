part of lasotuvi_presentation;

class AppBarTrailing extends ConsumerStatefulWidget {
  const AppBarTrailing({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppBarTrailingState();
}

class _AppBarTrailingState extends ConsumerState<AppBarTrailing> {
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
      if (kDebugMode) {
        print('AppBarTrailing: signin!');
      }
      // startListening();
      setState(() {
        uid = user.uidInFirestore;
      });
      // _streamSubscription?.resume();
      return user.uidInFirestore;
    }, () {
      if (kDebugMode) {
        print('AppBarTrailing: signout!');
      }
      // stopListening();
      setState(() {
        uid = null;
      });
    });
  }

  @override
  void dispose() {
    if (kDebugMode) {
      print('AppBarTrailing: disposed!');
    }
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(energyWidgetControllerProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: LiveEnergyWidget(
        iconColor: lightColorScheme.primary,
        textStyle: TextStyle(color: lightColorScheme.primary),
        controller: controller,
        uid: uid,
      ),
    );
  }
}
