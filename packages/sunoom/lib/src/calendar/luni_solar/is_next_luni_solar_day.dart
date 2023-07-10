import '../moment/moment.dart';

extension IsNextLuniSolarDay on Moment {
  bool isNextLuniDay() {
    return time.hour >= 23;
  }
}
