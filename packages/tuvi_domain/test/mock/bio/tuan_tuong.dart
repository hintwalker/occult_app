import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

final tuanTuong = HumanBio(
  name: 'Tuan Tuong',
  birthDay: Moment.fromGregorian(
    GregorianDate(
      year: 1965,
      month: 12,
      day: 5,
      timeZone: TimeZone(offsetInHour: 7),
    ),
    SimpleTime(hour: 13, minute: 15),
  ),
  watchingYear: 2023,
  gender: Gender.male,
);
