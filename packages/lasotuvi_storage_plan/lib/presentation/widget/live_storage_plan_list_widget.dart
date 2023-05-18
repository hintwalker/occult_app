part of lasotuvi_storage_plan;

class LiveStoragePlanListWidget extends StatelessWidget {
  const LiveStoragePlanListWidget({
    super.key,
    required this.controller,
    required this.translate,
    required this.energyIcon,
    required this.style,
    required this.timer,
    this.activedPlanId,
    this.previousPlanId,
    this.uid,
  });

  final String? uid;
  final StoragePlanListController controller;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;
  final Widget timer;
  final String? activedPlanId;
  final String? previousPlanId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.allPlans(uid),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: StoragePlanList(
                plans: snapshot.requireData,
                onRegister: (_) {},
                translate: translate,
                style: style,
                energyIcon: energyIcon,
                timer: timer,
                activedPlanId: activedPlanId,
                previousPlanId: previousPlanId,
              ),
            );
          } else {
            return const Center(
              child: Text('!'),
            );
          }
        });
  }
}
