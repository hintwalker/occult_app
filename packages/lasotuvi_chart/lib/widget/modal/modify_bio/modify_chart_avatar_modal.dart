part of lasotuvi_chart;

class ModifyChartAvatarModal extends StatelessWidget {
  const ModifyChartAvatarModal({
    super.key,
    required this.title,
    required this.child,
  });
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(title: title, children: [
      Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: child,
      ),
    ]);
  }
}
