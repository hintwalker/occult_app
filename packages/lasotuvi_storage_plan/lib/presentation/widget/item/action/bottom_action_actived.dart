part of lasotuvi_storage_plan;

class BottomActionActived extends StatelessWidget {
  const BottomActionActived(
    this.subscription, {
    super.key,
    required this.translate,
    required this.style,
    required this.expiredTimerController,
    required this.plan,
    required this.onUnsubscribe,
  });
  final String Function(String) translate;
  final StoragePlanStyle style;
  final Subscription subscription;
  final ExpiredTimerController expiredTimerController;
  final StoragePlan plan;
  final void Function() onUnsubscribe;

  @override
  Widget build(BuildContext context) {
    return plan.id == StoragePlanIds.free
        ? Text(translate('using'), style: style.using)
        : Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                translate('msgNextPaymentTitle'),
                style: style.nextPaymentTitle,
              ),
              ExpiredDuration(subscription,
                  translate: translate,
                  controller: expiredTimerController,
                  style: style),
              OutlinedButton(
                onPressed: onUnsubscribe,
                style: style.cancelButton,
                child: Text('${translate('unsubscribe')} ${plan.title}'),
              )
            ],
          );
  }
}
