part of lasotuvi_storage_plan;

class CanceledDateTime extends StatelessWidget {
  const CanceledDateTime(
    this.subscription, {
    super.key,
    required this.style,
  });

  final Subscription subscription;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return DateTimeWidget(subscription.expiredDate, style: style.canceledTime);
  }
}
