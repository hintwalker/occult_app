import 'sun_longitude_from_jdn.dart';

List<double> sunLongitudeList(List<double> firstJdnPerMonths) {
  final List<double> result = [];
  for (var jdn in firstJdnPerMonths) {
    result.add(sunLongitudeFromJdn(jdn));
  }
  return result;
}
