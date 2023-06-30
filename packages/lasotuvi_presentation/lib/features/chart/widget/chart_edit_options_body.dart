part of lasotuvi_presentation;

class ChartEditOptionsBody extends StatelessWidget {
  const ChartEditOptionsBody(this.chart, {super.key});
  final Chart chart;

  @override
  Widget build(BuildContext context) {
    return ChartEditOptionsModal(
      chart,
      colorScheme: lightColorScheme,
      translate: translate,
      onOpenChangeAvatar: (chart) {},
      onOpenChangeName: (chart) {},
      onOpenChangeGender: (chart) {},
      onOpenChangeBirthday: (chart) {},
      onOpenChangeWatchingYear: (chart) {},
    );
  }
}
