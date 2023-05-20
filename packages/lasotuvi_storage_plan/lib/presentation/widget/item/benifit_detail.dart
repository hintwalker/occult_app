part of lasotuvi_storage_plan;

class BenifitDetail extends StatelessWidget {
  const BenifitDetail({
    super.key,
    required this.limitCount,
    required this.title,
    required this.style,
  });
  final int limitCount;
  final String title;
  final StoragePlanStyle style;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.done,
        color: style.iconColor,
      ),
      title: Text(
        '$limitCount $title',
        style: style.benifit,
      ),
    );
  }
}
