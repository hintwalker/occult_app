part of tuvi_chart_diagram;

class ChartInfo extends StatelessWidget {
  const ChartInfo({
    super.key,
    required this.chart,
    required this.humanBio,
    required this.translate,
  });
  final HumanBio humanBio;
  final TuViChart chart;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 4,
            ),
            HumanName(humanBio.name),
            HumanGender(
              humanBio.dnan,
              translate: translate,
            ),
            // Row(
            //   children: [

            //     const SizedBox(
            //       width: 8,
            //     ),

            //   ],
            // ),
            const SizedBox(
              height: 4,
            ),
            HumanBirthDay(humanBio.birthDay, translate: translate),
            const SizedBox(
              height: 4,
            ),
            HumanWatchingYear(humanBio.birthDay,
                watchingYear: humanBio.watchingYear, translate: translate),
            const SizedBox(
              height: 4,
            ),
            HumanAmDuong(
              posOfMenh: chart.posOfMenh.toInt(),
              bornYear: humanBio.birthDay.luniSolarDate.year,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            MenhCuc(
              humanBio: humanBio,
              banMenh: chart.banMenh,
              cuc: chart.cuc,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            ThanCu(
              chart,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            MenhChuWidget(
              chart.posOfMenh,
              translate: translate,
            ),
            const SizedBox(
              height: 4,
            ),
            ThanChuWidget(
              humanBio.birthDay.luniSolarDate.year,
              translate: translate,
            ),
          ],
        ),
      ),
    );
  }
}
