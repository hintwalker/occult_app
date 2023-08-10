import 'string_format_2_digits.dart';

String formatDateVn({
  required int year,
  required int month,
  required int day,
  String dateSeperator = '-',
}) {
  final dayString = stringFormat2Digits(day);
  final monthString = stringFormat2Digits(month);
  return '$dayString$dateSeperator$monthString$dateSeperator$year';
}

String formatGregorianDateTimeVn({
  required int year,
  required int month,
  required int day,
  required int hour,
  required int minute,
  int? second,
  String dateSeperator = '-',
  String timeSeperator = ':',
}) {
  final dayString = '${stringFormat2Digits(day)}$dateSeperator';
  final monthString = '${stringFormat2Digits(month)}$dateSeperator';
  final hourString = '${stringFormat2Digits(hour)}$timeSeperator';
  final minuteString = '${stringFormat2Digits(minute)}\'';
  final secondString =
      second == null ? '' : '$timeSeperator${stringFormat2Digits(second)}"';

  return '$dayString$monthString$year, $hourString$minuteString$secondString';
}

String formatLuniDateVn({
  required int year,
  required int month,
  required int day,
  required String Function(int year) canName,
  required String Function(int year) chiName,
  String dateSeperator = '-',
}) {
  final date = formatDateVn(
    year: year,
    month: month,
    day: day,
    dateSeperator: dateSeperator,
  );
  return '$date (${canName(year)} ${chiName(year)})';
}
