import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

final bi = HumanBio(
  name: 'Bi',
  birthDay: Moment.fromGregorian(
    GregorianDate(
      year: 1990,
      month: 4,
      day: 14,
      timeZone: TimeZone(offsetInHour: 7),
    ),
    SimpleTime(hour: 23, minute: 55),
  ),
  watchingYear: 2023,
  gender: Gender.female,
);
