import 'dart:math';

import '../sun/sun_longitude_from_jdn.dart';
import 'jdn_on_new_moon_day.dart';
import 'jdn_on_new_moon_local.dart';

double firstJdnInNov(int gregorianYear, int timeZoneOffsetInHour) {
  final newMoonJdn = jdnOfNewMoonLocal(gregorianYear, timeZoneOffsetInHour);
  final sunLongitude = sunLongitudeFromJdn(newMoonJdn.jdn);
  if (_mustMoveBackWard(sunLongitude)) {
    return jdnOnNewMoonDay(newMoonJdn.monthOffset - 1);
  }
  return newMoonJdn.jdn;
}

bool _mustMoveBackWard(double sunLongitude) {
  const checkingValue = 3 * pi / 2;
  final delta = sunLongitude - checkingValue;
  return delta > 0.01;
}
