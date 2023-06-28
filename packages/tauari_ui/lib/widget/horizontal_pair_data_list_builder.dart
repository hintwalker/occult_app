part of tauari_ui;

class HorizontalPairDataListBuilder<
    E extends SyncableEntity,
    O extends SyncableEntity,
    P extends SyncableEntityPair<E, O>> extends StatelessWidget {
  const HorizontalPairDataListBuilder({
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
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return itemWidget(snapshot.requireData.elementAt(index));
              },
              itemCount: snapshot.requireData.length,
            );
          } else {
            return const ErrorTextWidget();
          }
        });
  }
}
