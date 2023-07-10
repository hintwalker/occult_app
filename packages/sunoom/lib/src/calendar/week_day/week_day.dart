import 'week_day_data.dart';
import 'week_day_enum.dart';

class WeekDay {
  final int index;
  final String name;
  final String nameShort;
  final String nameOneLetter;
  final bool isWeekend;
  const WeekDay({
    required this.index,
    required this.name,
    required this.nameShort,
    required this.nameOneLetter,
    required this.isWeekend,
  });

  factory WeekDay.fromDateTime(DateTime dateTime) {
    var index = dateTime.weekday;
    if (index == 7) index = 0;
    return WeekDay.fromIndex(index);
  }

  factory WeekDay.fromEnum(WeekDays weekDay) =>
      WeekDay.fromIndex(weekDay.index);

  factory WeekDay.fromIndex(int index) {
    return WeekDay.fromMap(weekDayData[index]!);
  }

  factory WeekDay.fromMap(Map<String, Object> map) {
    return WeekDay(
      index: map['index'] as int,
      name: map['name'] as String,
      nameShort: map['nameShort'] as String,
      nameOneLetter: map['nameOneLetter'] as String,
      isWeekend: map['isWeekend'] as bool,
    );
  }
}
