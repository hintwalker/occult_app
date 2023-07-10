import '../../conversion/luni_solar_2_gregorian.dart';
import '../../zone/time_zone.dart';
import '../moment/moment.dart';
import '../simple_time.dart';
import 'luni_solar_date.dart';

extension MomentFromLuniSolar on Moment {
  static Moment fromLuniSolar({
    required LuniSolarDate date,
    required SimpleTime time,
    required TimeZone timeZone,
  }) {
    final gregorian = luniSolar2Gregorian(date);
    return Moment(
      gregorian: gregorian,
      // luni: date,
      time: time,
      timeZone: timeZone,
    );
  }
}
