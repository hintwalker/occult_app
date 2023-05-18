part of lasotuvi_presentation;

class StoragePlanScreenBody extends ConsumerStatefulWidget {
  const StoragePlanScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StoragePlanScreenBodyState();
}

class _StoragePlanScreenBodyState
    extends AuthDependedState<StoragePlanScreenBody> {
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

            return LiveStoragePlanListWidget(
                uid: uid,
                activedPlanId: activedId,
                previousPlanId: previousId,
                controller: ref.read(storagePlanListControllerProvider),
                translate: translate,
                energyIcon: EnergyIcon(color: lightColorScheme.primary),
                style: StoragePlanStyleImpl(),
                timer: TimerDisplayContainer(
                  data,
                  translate: translate,
                  style: ExpiredTimerStyle(),
                  controller: ref.read(expiredTimerControllerProvider),
                  uid: uid,
                ));
          } else {
            return const Center(child: SimpleErrorWidget());
          }
        });
  }
}
