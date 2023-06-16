part of lasotuvi_presentation;

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends AuthDependedState<HomeBody> {
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
            height: 180.0,
            child: TopTenChartsBanner(
              controller: ref.watch(chartListControllerProvider),
              uid: uid,
              translate: translate,
              colorScheme: lightColorScheme,
            ),
          )
        ],
      ),
    );
  }
}
