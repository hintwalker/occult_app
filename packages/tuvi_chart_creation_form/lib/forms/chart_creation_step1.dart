part of tuvi_chart_creation_form;

class ChartCreationStep1 extends StatelessWidget {
  const ChartCreationStep1({
    super.key,
    required this.colorScheme,
    required this.translate,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final double space = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChartAvatarInput(),
        ChartNameInput(
          translate: translate,
        ),
        SizedBox(
          height: space,
        ),
        ChartGenderInput(
          colorScheme: colorScheme,
          translate: translate,
        ),
        SizedBox(
          height: space,
        ),
      ],
    );
  }
}
