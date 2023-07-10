import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

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
          style: const TextStyle(fontSize: 14.0, letterSpacing: 1.2),
        ),
        Text(
          moment.toLuniSolarDateString(canName: canName, chiName: chiName),
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
          ),
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
