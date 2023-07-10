import 'package:flutter/material.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget(
    this.dateTime, {
    super.key,
    required this.style,
  });
  final DateTime dateTime;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final offset = dateTime.timeZoneOffset.inHours;
    final offsetString = offset >= 0 ? '+$offset' : '$offset';
    return Text(
        style: style,
        '${dateTime.day}/${dateTime.month}/${dateTime.year} | ${dateTime.hour}:${dateTime.minute}:${dateTime.second} UTC$offsetString');
  }
}
