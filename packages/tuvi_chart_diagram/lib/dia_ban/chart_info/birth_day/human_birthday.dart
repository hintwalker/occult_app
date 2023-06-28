part of tuvi_chart_diagram;

class HumanBirthDay extends StatelessWidget {
  const HumanBirthDay(this.birthday, {super.key, required this.translate});
  final String Function(String) translate;
  final Moment birthday;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HumanGregorian(birthday, translate: translate),
        const SizedBox(
          height: 4,
        ),
        HumanLuniSolar(birthday, translate: translate),
      ],
    );
  }
}
