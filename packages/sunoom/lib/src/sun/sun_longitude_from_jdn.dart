part of sunoom;

double sunLongitudeFromJdn(double jdn) {
  final t = (jdn - 2451545.0) / 36525;
  final t2 = t * t;
  const dr = pi / 180;
  final m = 357.52910 +
      35999.05030 * t -
      0.0001559 * t2 -
      0.00000048 * t * t2; // mean anomaly, degree
  final l0 =
      280.46645 + 36000.76983 * t + 0.0003032 * t2; // mean longitude, degree;
  double dL = (1.914600 - 0.004817 * t - 0.000014 * t2) * sin(dr * m);
  dL +=
      (0.019993 - 0.000101 * t) * sin(dr * 2 * m) + 0.000290 * sin(dr * 3 * m);
  double l = l0 + dL; // true longitude, degree
  l *= dr;
  l -= pi * 2 * (l ~/ (pi * 2)); // Normalize to (0, 2*pi)
  while (l < 0) {
    l += 2 * pi;
  }
  while (l > 2 * pi) {
    l -= 2 * pi;
  }
  return l;
}
