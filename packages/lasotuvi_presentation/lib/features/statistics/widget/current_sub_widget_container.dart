part of lasotuvi_presentation;

class CurrentSubWidgetContainer extends ConsumerStatefulWidget {
  const CurrentSubWidgetContainer({
    super.key,
    this.uid,
    required this.translate,
  });
  final String? uid;
  final String Function(String) translate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CurrentSubState();
}

class _CurrentSubState extends ConsumerState<CurrentSubWidgetContainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.watch(currentSubControllerProvider).dataStream(widget.uid),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final data = snapshot.requireData;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (data != null)
                  StoragePlanInfoWidget(
                    uid: widget.uid,
                    planId: data.status == SubscriptionStatus.canceled
                        ? StoragePlanIds.free
                        : data.packageId,
                    style: StoragePlanStyleImpl(),
                    translate: widget.translate,
                    energyIcon: EnergyIcon(color: lightColorScheme.primary),
                    takeStoragePlanById: ref.read(takeStoragePlanByIdProvider),
                  ),
                if (data != null && data.status != SubscriptionStatus.canceled)
                  TimerDisplayContainer(data,
                      translate: widget.translate,
                      style: ExpiredTimerStyle(),
                      controller: ref.read(expiredTimerControllerProvider),
                      uid: widget.uid),
                if (data != null && data.status == SubscriptionStatus.canceled)
                  CanceledPreviousAlert(
                    data,
                    translate: widget.translate,
                  )
              ],
            );
          } else {
            return const Center(child: SimpleErrorWidget());
          }
        });
  }

  // Future<void> onExpired(Subscription subscription) async {
  //   if (subscription.status == SubscriptionStatus.actived) {
  //     await ref.read(updateCurrentSubProvider)(widget.uid,
  //         subscription.copyWith(status: SubscriptionStatus.expired));
  //     if (kDebugMode) {
  //       print('Save expired');
  //     }
  //   }
  // }

  // Future<void> onCanceled(Subscription subscription) async {
  //   if (subscription.status != SubscriptionStatus.canceled) {
  //     await ref.read(updateCurrentSubProvider)(widget.uid,
  //         subscription.copyWith(status: SubscriptionStatus.canceled));
  //     if (kDebugMode) {
  //       print('Save canceled');
  //     }
  //   }
  // }
}
