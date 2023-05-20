part of lasotuvi_storage_plan;

class BottomActionCanceled extends StatelessWidget {
  const BottomActionCanceled(
    this.subscription, {
    super.key,
    required this.translate,
    required this.style,
    // required this.expiredTimerController,
    required this.plan,
    required this.onSubscribe,
  });
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Subscription subscription;
  // final ExpiredTimerController expiredTimerController;
  final StoragePlan plan;
  final void Function(StoragePlan) onSubscribe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          translate('msgExpired'),
          style: style.expiredTitle,
        ),
        DateTimeWidget(subscription.expiredDate, style: style.expiredTime),
        Text(translate('msgCancel'), style: style.canceledTitle),
        DateTimeWidget(subscription.expiredDate.add(TimeConfig.cancelDuration),
            style: style.canceledTime),
        const SizedBox(
          height: 18.0,
        ),
        FilledButton(
            onPressed: () => onSubscribe(plan),
            child: Text('${translate('subscribePackage')} ${plan.title}'))
      ],
    );
  }
}
