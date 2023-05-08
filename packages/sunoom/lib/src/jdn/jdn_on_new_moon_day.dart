part of sunoom;

double jdnOnNewMoonDay(int monthOffset) {
  final t = monthOffset / 1236.85;
  final t2 = t * t;
  final t3 = t2 * t;
  const dr = pi / 180;
  double jd1 = 2415020.75933 +
      29.53058868 * monthOffset +
      0.0001178 * t2 -
      0.000000155 * t3;
  jd1 += 0.00033 *
      sin((166.56 + 132.87 * t - 0.009173 * t2) * dr); // Mean new moon
  final m = 359.2242 +
      29.10535608 * monthOffset -
      0.0000333 * t2 -
      0.00000347 * t3; // Sun's mean anomaly
  final mpr = 306.0253 +
      385.81691806 * monthOffset +
      0.0107306 * t2 +
      0.00001236 * t3; // Moon's mean anomaly
  final f = 21.2964 +
      390.67050646 * monthOffset -
      0.0016528 * t2 -
      0.00000239 * t3; // Moon's argument of latitude
  double c1 = (0.1734 - 0.000393 * t) * sin(m * dr) + 0.0021 * sin(2 * dr * m);
  c1 = c1 - 0.4068 * sin(mpr * dr) + 0.0161 * sin(dr * 2 * mpr);
  c1 -= 0.0004 * sin(dr * 3 * mpr);
  c1 = c1 + 0.0104 * sin(dr * 2 * f) - 0.0051 * sin(dr * (m + mpr));
  c1 = c1 - 0.0074 * sin(dr * (m - mpr)) + 0.0004 * sin(dr * (2 * f + m));
  c1 = c1 - 0.0004 * sin(dr * (2 * f - m)) - 0.0006 * sin(dr * (2 * f + mpr));
  c1 += 0.0010 * sin(dr * (2 * f - mpr)) + 0.0005 * sin(dr * (2 * mpr + m));
  double deltaT;
  if (t < -11) {
    deltaT = 0.001 +
        0.000839 * t +
        0.0002261 * t2 -
        0.00000845 * t3 -
        0.000000081 * t * t3;
  } else {
    deltaT = -0.000278 + 0.000265 * t + 0.000262 * t2;
  }
  return jd1 + c1 - deltaT;
}
