part of lasotuvi_presentation;

class HomeScreenBody extends ConsumerStatefulWidget {
  const HomeScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends AuthDependedState<HomeScreenBody> {
  // StreamSubscription? _streamSubscription;
  // String? uid;
  // @override
  // void initState() {
  //   super.initState();
  //   startListening();
  // }

  // void startListening() {
  //   _streamSubscription =
  //       ref.read(registerOnAuthStateChangedProvider).call((user) {
  //     setState(() {
  //       uid = user.uidInFirestore;
  //     });
  //     return user.uidInFirestore;
  //   }, () {
  //     setState(() {
  //       uid = null;
  //     });
  //   });
  // }

  // @override
  // void dispose() {
  //   _streamSubscription?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CurrentSubWidgetContainer(
            uid: uid,
            translate: translate,
          ),
          SizedBox(
            height: 200.0,
            child: HorizontalChartList(
              controller: ref.watch(chartListControllerProvider),
              uid: uid,
            ),
          )
        ],
      ),
    );
  }
}
