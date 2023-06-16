part of lasotuvi_chart;

class HoriChartBirthdayWidget extends StatelessWidget {
  const HoriChartBirthdayWidget(
    this.moment, {
    super.key,
    required this.translate,
  });
  final Moment moment;
  final String Function(String) translate;

  String canName(Can can) => translate(can.name);
  String chiName(Chi chi) => translate(chi.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          moment.toGregorianDateString(),
          style: const TextStyle(fontSize: 14.0),
        ),
        Text(
          moment.toLuniSolarDateString(canName: canName, chiName: chiName),
          style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14.0),
        ),
      ],
    );
  }
}
