import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

final hinh = HumanBio(
  name: 'Hinh',
  birthDay: Moment.fromGregorian(
    GregorianDate(
      year: 1987,
      month: 12,
      day: 7,
      timeZone: TimeZone(offsetInHour: 7),
    ),
    SimpleTime(hour: 14, minute: 45),
  ),
  watchingYear: 2023,
  gender: Gender.male,
);
