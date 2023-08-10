import 'format_date_time_vn.dart';

extension DateTimeToStringVn on DateTime {
  String toStringVn({
    String dateSeperator = '-',
    String timeSeperator = ':',
    bool showSeconds = false,
  }) {
    return formatGregorianDateTimeVn(
      year: year,
      month: month,
      day: day,
      hour: hour,
      minute: minute,
      second: showSeconds ? second : null,
      dateSeperator: dateSeperator,
      timeSeperator: timeSeperator,
    );
  }
}
