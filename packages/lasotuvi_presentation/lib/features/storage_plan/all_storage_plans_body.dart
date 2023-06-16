part of lasotuvi_presentation;

class AllStoragePlansBody extends ConsumerStatefulWidget {
  const AllStoragePlansBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AllStoragePlansBodyState();
}

class _AllStoragePlansBodyState extends AuthDependedState<AllStoragePlansBody> {
  // @override
  // void dispose() {
  //   ref.read(expiredTimerControllerProvider).cancelAllTimer();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(currentSubControllerProvider).dataStream(uid),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.requireData;
            final activedId = data == null
                ? StoragePlanIds.free
                : data.status == SubscriptionStatus.canceled
                    ? StoragePlanIds.free
                    : data.packageId;
            final previousId = data?.packageId;
            final style = StoragePlanStyleImpl();

            return LiveStoragePlanListWidget(
              uid: uid,
              activedPlanId: activedId,
              previousPlanId: previousId,
              controller: ref.read(storagePlanListControllerProvider),
              translate: translate,
              energyIcon: EnergyIcon(
                  color: lightColorScheme.primary, size: style.energyIconSize),
              style: style,
              expiredTimerController: ref.read(expiredTimerControllerProvider),
              currentSubController: ref.read(currentSubControllerProvider),
            );
          } else {
            return const Center(child: SimpleErrorWidget());
          }
        });
  }
}
