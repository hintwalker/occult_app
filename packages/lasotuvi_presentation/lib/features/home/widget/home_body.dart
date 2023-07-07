part of lasotuvi_presentation;

class HomeBody extends ConsumerStatefulWidget {
  const HomeBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeBodyState();
}

class _HomeBodyState extends AuthDependedState<HomeBody> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CurrentSubWidgetContainer(
                uid: uid,
                translate: translate,
              ),
              SizedBox(
                height: GeneralStyle.topTenBannerHeight,
                child: TopTenChartsBanner(
                  controller: ref.watch(chartListControllerProvider),
                  uid: uid,
                  translate: translate,
                  colorScheme: lightColorScheme,
                  onAddData: () => ChartHelper.openChartCreationScreen(context),
                  onShowAll: openAllChartsScreen,
                  onItemTap: (context, chart) => ChartHelper.openChartView(
                    context: context,
                    chart: chart,
                  ),
                  // chartView: (chartId) => ChartViewBody(chartId: chartId),
                  storageOptionsModalBuilder: (item, {syncStatus, uid}) =>
                      StorageHelper.storageOptionsModalBuilder(item,
                          uid: uid, syncStatus: item.syncStatus, ref: ref),
                ),
              ),
              SizedBox(
                height: 168.0,
                child: TopTenTagsBanner(
                  controller: ref.watch(tagListControllerProvider),
                  uid: uid,
                  translate: translate,
                  colorScheme: lightColorScheme,
                  onAddData: () => TagHelper.openTagCreationScreen(
                    context,
                    (tag) =>
                        TagHelper.openTagDetail(context: context, tag: tag),
                  ),
                  onShowAll: openAllTagsScreen,
                  onItemTap: (context, tag) =>
                      TagHelper.openTagDetail(context: context, tag: tag),
                  storageOptionsModalBuilder: (item, {syncStatus, uid}) =>
                      StorageHelper.storageOptionsModalBuilder(item,
                          uid: uid, syncStatus: item.syncStatus, ref: ref),
                ),
              ),
              // Expanded(
              // child:
              TopTenNotesBanner(
                uid: uid,
                controller: ref.watch(noteAndChartListControllerProvider),
                translate: translate,
                colorScheme: lightColorScheme,
                onAddData: () =>
                    NoteHelper.openChartSelectionScreen(context, ref),
                onShowAll: openAllNotesScreen,
                onItemTap: (note) =>
                    NoteHelper.openNoteEditorScreen(context, note),
                storageOptionsModalBuilder: (item, {syncStatus, uid}) =>
                    StorageHelper.storageOptionsModalBuilder(item,
                        uid: uid, syncStatus: item.syncStatus, ref: ref),
              ),
              const SizedBox(
                height: 48.0,
              ),
              ElevatedButton(
                  onPressed: openAllNotesScreen,
                  child: Text(translate('showAllNotes'))),
              const SizedBox(
                height: 192.0,
              ),
              const Divider(
                height: 1.0,
                thickness: 1.0,
              ),
              const SizedBox(
                height: 2.0,
              ),
              const Divider(
                height: 1.0,
                thickness: 1.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('---', style: TextStyle(color: lightColorScheme.primary))
                ],
              )
              // )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                color: lightColorScheme.primaryContainer,
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(44.0),
                  bottomRight: Radius.circular(44.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: lightColorScheme.outline,
                    offset: const Offset(2.0, 2.0),
                    spreadRadius: 1.0,
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                    color: lightColorScheme.primaryContainer,
                    // offset: const Offset(2.0, 2.0),
                    // spreadRadius: 2.0,
                    // blurRadius: 2.0,
                  )
                ]),
            child: InkWell(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => const DataCreationOptionsModal()),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(44.0),
                bottomRight: Radius.circular(44.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: null,
                  disabledColor: lightColorScheme.primary,
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // void openChartView({required BuildContext context, required String chartId}) {
  //   Scaffold.of(context).showBottomSheet(
  //       // context: context,
  //       (_) {
  //     return SingleChildScrollView(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [ChartViewBody(chartId: chartId)],
  //       ),
  //     );
  //   });
  // }

  // void openChartCreationScreen() {
  //   context.pushNamed(RouteName.chartCreation);
  //   // showGeneralDialog(
  //   //   context: context,
  //   //   barrierDismissible: false,
  //   //   transitionDuration: const Duration(seconds: 1),
  //   //   transitionBuilder: (context, animation, secondaryAnimation, child) =>
  //   //       FadeTransition(
  //   //           opacity: animation,
  //   //           child: ScaleTransition(scale: animation, child: child)),
  //   //   pageBuilder: (context, animation, secondaryAnimation) => SafeArea(
  //   //       child: Container(
  //   //     width: MediaQuery.of(context).size.width,
  //   //     height: MediaQuery.of(context).size.height,
  //   //     padding: const EdgeInsets.all(16.0),
  //   //     child: ChartCreationForm(
  //   //         colorScheme: lightColorScheme,
  //   //         translate: translate,
  //   //         onCreateChart: onCreateChart),
  //   //   )),
  //   // );
  // }

  void openAllChartsScreen() {
    // context.goNamed(RouteName.charts);
    ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.charts);
  }

  void openAllTagsScreen() {
    context.goNamed(RouteName.allTags);
  }

  // void openChartSelectionScreen() {
  //   showBottomSheet(
  //       context: context,
  //       builder: (ctx) {
  //         return SingleChildScrollView(
  //             child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //               SizedBox(
  //                 height: MediaQuery.sizeOf(context).height * 4 / 5,
  //                 child: SingleSelectableChartListBody(
  //                   onSelect: (_, chart, uid) {
  //                     openNoteEditorScreen(chart, uid);
  //                   },
  //                 ),
  //               ),
  //             ]));
  //       });
  // }

  // Future<void> openNoteEditorScreen(Chart chart, String? uid) async {
  //   final now = DateTime.now();
  //   final noteId = await ref.read(insertNoteToLocalProvider)(Note(
  //       now.millisecondsSinceEpoch,
  //       title: 'No title',
  //       content: '',
  //       created: now,
  //       edited: now,
  //       chartId: chart.id));
  //   if (context.mounted) {
  //     context.pop();
  //     context.pushNamed(RouteName.noteEditor, pathParameters: {
  //       RouterParams.noteId: noteId.toString(),
  //     });
  //   }
  // }

  void openAllNotesScreen() {
    context.goNamed(RouteName.allNotes);
  }
}
