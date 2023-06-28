part of tauari_ui;

class TopTenHeadlineWidget extends StatelessWidget {
  const TopTenHeadlineWidget(
    this.title, {
    super.key,
    required this.colorScheme,
    required this.onAddData,
    required this.onShowAll,
    required this.showAllText,
  });

  final String title;
  final ColorScheme colorScheme;
  final void Function() onAddData;
  final void Function() onShowAll;
  final String showAllText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TopTenTitleWidget(title, colorScheme: colorScheme),
        const SizedBox(
          width: 12.0,
        ),
        TopTenAddDataButton(colorScheme: colorScheme, onTap: onAddData),
        const Spacer(),
        TopTenShowAllButton(showAllText,
            onTap: onShowAll, colorScheme: colorScheme)
      ],
    );
  }
}
