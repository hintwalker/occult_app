import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_ui/tauari_ui.dart';

class Birthday extends UniversalWidget {
  const Birthday(
    this.moment, {
    super.key,
    required super.translate,
    this.gregorianStyle = const TextStyle(fontSize: 14.0, letterSpacing: 1.2),
    this.luniSolarStyle = const TextStyle(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
    ),
  });
  final Moment moment;
  final TextStyle? gregorianStyle;
  final TextStyle? luniSolarStyle;

  String canName(Can can) => translate(can.name);
  String chiName(Chi chi) => translate(chi.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          moment.toGregorianDateString(dateSeperator: '-'),
          style: gregorianStyle,
        ),
        Text(
          moment.toLuniSolarDateString(
              canName: canName, chiName: chiName, dateSeperator: '-'),
          style: luniSolarStyle,
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
