part of lasotuvi_storage_plan;

class BottomActionExpired extends StatelessWidget {
  const BottomActionExpired(
    this.subscription, {
    super.key,
    required this.translate,
    required this.style,
    required this.expiredTimerController,
    required this.plan,
    required this.onExtends,
  });
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Subscription subscription;
  final ExpiredTimerController expiredTimerController;
  final StoragePlan plan;
  final void Function() onExtends;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          translate('msgExpired'),
          style: style.expiredTitle,
        ),
        DateTimeWidget(subscription.expiredDate, style: style.expiredTime),
        Text(translate('msgWillCancel'), style: style.willCancelTitle),
        ExpiredDuration(subscription,
            translate: translate,
            controller: expiredTimerController,
            style: style),
        const SizedBox(
          height: 18.0,
        ),
        FilledButton(
            onPressed: onExtends,
            child: Text('${translate('extendPackage')} ${plan.title}'))
      ],
    );
  }
}
