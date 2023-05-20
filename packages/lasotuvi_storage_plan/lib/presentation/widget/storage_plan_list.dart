part of lasotuvi_storage_plan;

class StoragePlanList extends StatelessWidget {
  const StoragePlanList({
    super.key,
    required this.plans,
    this.activedPlanId,
    this.previousPlanId,
    required this.onRegister,
    required this.translate,
    required this.energyIcon,
    required this.style,
    required this.expiredTimerController,
    required this.subscription,
    required this.controller,
    // this.uid,
  });
  final Iterable<StoragePlan> plans;
  final String? activedPlanId;
  final String? previousPlanId;
  final void Function(StoragePlan plan) onRegister;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;
  final ExpiredTimerController expiredTimerController;
  final StoragePlanListController controller;
  final Subscription subscription;
  // final String? uid;
  // final Widget timer;

  bool isRegistered(String docId) => activedPlanId == docId;
  bool shouldDisplayPrevious(String docId) =>
      activedPlanId == StoragePlanIds.free && previousPlanId == docId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 92.0),
        itemCount: plans.length,
        itemBuilder: (ctx, index) {
          final docId = plans.elementAt(index).docId;
          return StoragePlanListItem(
            item: plans.elementAt(index),
            actived: isRegistered(docId),
            onItemTap: onRegister,
            translate: translate,
            energyIcon: energyIcon,
            timer: expiredTimerController, //isRegistered(docId) ? timer : null,
            shouldDisplayPrevious: shouldDisplayPrevious(docId),
            style: style,
            subscription: subscription,
            controller: controller,
            // uid: uid,
          );
        });
    // return FutureBuilder(
    //     future: controller.allStoragePlans(uid),
    //     builder: (ctx, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       } else if (snapshot.hasData) {
    //         final data = snapshot.requireData;
    //         return ListView.builder(
    //           itemCount: data.length,
    //           itemBuilder: (ctx, index) {
    //           return StoragePlanListItem(
    //               item: data.elementAt(index));
    //         });
    //       } else {
    //         return const Center(child: Text('!'));
    //       }
    //     });
  }
}
