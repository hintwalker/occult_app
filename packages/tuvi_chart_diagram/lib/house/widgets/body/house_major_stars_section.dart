part of tuvi_chart_diagram;

class HouseMajorStarsSection extends StatelessWidget {
  const HouseMajorStarsSection(this.data,
      {super.key, this.autoSizeGroup, required this.translate});
  final Iterable<Star> data;
  final AutoSizeGroup? autoSizeGroup;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        data.isEmpty
            ? const Text(
                '',
                style: TextStyle(height: 1),
              )
            : MajorStarItem(data.first, translate: translate)
        // AutoSizeTranslatedText(
        //     data.first.name.name,
        //     style: const TextStyle(height: 1),
        //     autoSizeGroup: autoSizeGroup,
        //     translate: translate,
        //   )
        ,
        data.isEmpty
            ? const Text(
                '',
                style: TextStyle(height: 1),
              )
            : data.length == 1
                ? const Text(
                    '',
                    style: TextStyle(height: 1),
                  )
                : MajorStarItem(data.last, translate: translate)
        // AutoSizeTranslatedText(
        //     data.last.name.name,
        //     style: const TextStyle(height: 1),
        //     autoSizeGroup: autoSizeGroup,
        //     translate: translate,
        //   )
        ,
      ],
    );
  }
}
