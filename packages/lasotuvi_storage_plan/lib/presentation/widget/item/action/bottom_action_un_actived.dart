part of lasotuvi_storage_plan;

class BottomActionUnActived extends StatelessWidget {
  const BottomActionUnActived({
    super.key,
    required this.translate,
    required this.style,
    required this.plan,
    required this.onSubscribe,
  });
  final String Function(String) translate;
  final StoragePlanStyle style;
  final StoragePlan plan;
  final void Function(StoragePlan) onSubscribe;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () => onSubscribe(plan),
        child: Text('${translate('subscribePackage')} ${plan.title}'));
  }
}
