part of lasotuvi_storage_plan;

class PlanDetailItem extends StatelessWidget {
  const PlanDetailItem({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [Text(title), Text(value)],
    );
  }
}
