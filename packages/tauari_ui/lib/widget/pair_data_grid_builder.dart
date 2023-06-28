part of tauari_ui;

class PairDataGridBuilder<E extends SyncableEntity, O extends SyncableEntity,
    P extends SyncableEntityPair<E, O>> extends StatelessWidget {
  const PairDataGridBuilder({
    super.key,
    this.uid,
    required this.controller,
    required this.itemWidget,
    required this.queryArgs,
  });

  final String? uid;
  final SyncablePairDataListStreamController<E, O, P> controller;
  final Widget Function(P) itemWidget;
  final QueryArgs queryArgs;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream(uid, queryArgs),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasData) {
            final data = snapshot.requireData;
            return StaggeredGrid.count(
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              axisDirection: AxisDirection.down,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 4.0,
              crossAxisCount: 2,
              children: List.generate(
                  data.length, (index) => itemWidget(data.elementAt(index))),
            );
          } else {
            return const ErrorTextWidget();
          }
        });
  }
}
