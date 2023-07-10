import '../../sun/is_major_term_inside.dart';
import '../moment/moment.dart';

class LuniSolarMonth {
  final int index;
  final int value;
  final Moment firstDate;
  final bool isLeap;
  final double jdnOnFirstDay;
  LuniSolarMonth(
      this.index, this.value, this.firstDate, this.isLeap, this.jdnOnFirstDay);
  LuniSolarMonth copy(
      {int? index,
      int? value,
      Moment? firstDate,
      bool? isLeap,
      double? jdnOnFirstDay}) {
    return LuniSolarMonth(
        index ?? this.index,
        value ?? this.value,
        firstDate ?? this.firstDate,
        isLeap ?? this.isLeap,
        jdnOnFirstDay ?? this.jdnOnFirstDay);
  }

  static bool checkIfMonthIsLeap(
      int monthIndex, double currentSunLongitude, double prevSunLongitude) {
    if (monthIndex == 0) {
      return false;
    }
    final result = !isMajorTermInside(currentSunLongitude, prevSunLongitude);
    return result;
  }

  @override
  String toString() {
    return "index:$index, value:$value, firstDate:${firstDate.toString()}, jdn:$jdnOnFirstDay, leap:$isLeap";
  }
}
