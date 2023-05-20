part of lasotuvi_storage_plan;

class LiveStoragePlanListWidget extends StatelessWidget {
  const LiveStoragePlanListWidget({
    super.key,
    required this.controller,
    required this.translate,
    required this.energyIcon,
    required this.style,
    required this.expiredTimerController,
    this.activedPlanId,
    this.previousPlanId,
    this.uid,
    required this.currentSubController,
  });

  final String? uid;
  final StoragePlanListController controller;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;
  final ExpiredTimerController expiredTimerController;
  final String? activedPlanId;
  final String? previousPlanId;
  final CurrentSubController currentSubController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.allPlans(uid),
        builder: (ctx, plans) {
          if (plans.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (plans.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: StreamBuilder(
                  stream: currentSubController.onCurrentSub(uid),
                  builder: (ctx, snapshotSub) {
                    if (snapshotSub.connectionState ==
                        ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshotSub.hasData) {
                      return StoragePlanList(
                        plans: plans.requireData,
                        onRegister: (_) {},
                        translate: translate,
                        style: style,
                        energyIcon: energyIcon,
                        expiredTimerController: expiredTimerController,
                        activedPlanId: activedPlanId,
                        previousPlanId: previousPlanId,
                        subscription:
                            snapshotSub.requireData ?? Subscription.free(),
                        // uid: uid,
                        controller: controller,
                      );
                    } else {
                      return const Center(child: SimpleErrorWidget());
                    }
                  }),
            );
          } else {
            return const Center(
              child: Text('!'),
            );
          }
        });
  }
}
