import 'package:flutter/material.dart';
import 'package:tauari_date_format/tauari_date_format.dart';

class DurationWidget extends StatelessWidget {
  const DurationWidget({
    super.key,
    required this.translate,
    required this.style,
    required this.day,
    required this.hour,
    required this.minute,
    required this.second,
  });
  final String Function(String) translate;
  final TextStyle style;
  final int day;
  final int hour;
  final int minute;
  final int second;

  @override
  Widget build(BuildContext context) {
    final hourString = stringFormat2Digits(hour);
    final minuteString = stringFormat2Digits(minute);
    final secondString = stringFormat2Digits(second);
    return Text(
        '$day ${translate('day')} $hourString:$minuteString:$secondString',
        style: style);
  }
}
