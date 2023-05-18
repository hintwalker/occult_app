part of lasotuvi_storage_plan;

class StoragePlanListItem extends StatelessWidget {
  const StoragePlanListItem({
    super.key,
    required this.item,
    this.actived = false,
    this.shouldDisplayPrevious = false,
    required this.onItemTap,
    required this.translate,
    required this.energyIcon,
    this.timer,
  });
  final StoragePlan item;
  final bool actived;
  final void Function(StoragePlan plan) onItemTap;
  final String Function(String) translate;
  final Widget energyIcon;
  final Widget? timer;
  final bool shouldDisplayPrevious;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(item.title),
            const SizedBox(
              height: 8.0,
            ),
            Row(children: [energyIcon, Text('${item.energy} /day')]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlanDetailItem(
                    title: translate('chart'),
                    value: item.limitChart.toString()),
                PlanDetailItem(
                    title: translate('note'), value: item.limitNote.toString()),
                PlanDetailItem(
                    title: translate('tag'), value: item.limitTag.toString())
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            !actived
                ? FilledButton(
                    onPressed: () => onItemTap(item),
                    child: Text(
                      translate('register'),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                        Text(translate('registered')),
                        const SizedBox(
                          height: 8.0,
                        ),
                        if (timer != null) timer!
                      ]),
          ],
        ),
      ),
    );
  }
}
