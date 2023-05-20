part of lasotuvi_storage_plan;

class WillCancelTitle extends StatelessWidget {
  const WillCancelTitle({
    super.key,
    required this.style,
    required this.translate,
  });
  final StoragePlanStyle style;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Text(translate('msgWillCancelSubscription'),
        style: style.willCancelTitle);
  }
}
