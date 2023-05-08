part of sunoom;

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
