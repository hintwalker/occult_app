part of lasotuvi_chart;

class ModifyChartNameModal extends StatelessWidget {
  const ModifyChartNameModal({
    super.key,
    required this.child,
    required this.title,
  });
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return BasicDialog(title: title, children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: child,
      ),
    ]);
  }
}
