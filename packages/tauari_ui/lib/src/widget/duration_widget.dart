import 'package:flutter/material.dart';

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
    return Text('$day ${translate('day')} $hour:$minute:$second', style: style);
  }
}
