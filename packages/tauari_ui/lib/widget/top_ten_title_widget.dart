part of tauari_ui;

class TopTenTitleWidget extends StatelessWidget {
  const TopTenTitleWidget(
    this.text, {
    super.key,
    required this.colorScheme,
  });
  final String text;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 22.0, color: colorScheme.primary),
    );
  }
}
