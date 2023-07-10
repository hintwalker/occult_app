import '../can/can.dart';
import '../chi/chi.dart';
import 'ngu_hanh.dart';

NguHanh nguHanhOfYear(int year) {
  final canOfYear = Can.ofLuniYear(year);
  final chiOfYear = Chi.ofLuniYear(year);
  var sum = getValueOfCan(canOfYear) + getValueOfChi(chiOfYear);
  if (sum > 5) {
    sum -= 5;
  }
  return getNguHanhFromSum(sum);
}

int getValueOfChi(Chi chiOfYear) {
  final data = [0, 0, 1, 1, 2, 2, 0, 0, 1, 1, 2, 2];
  return data[chiOfYear.index];
}

int getValueOfCan(Can canOfYear) {
  final data = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5];
  return data[canOfYear.index];
}

NguHanh getNguHanhFromSum(int sum) {
  if (sum < 1 || sum > 5) {
    throw Error();
  }
  final data = [
    NguHanh.fromIndex(2),
    NguHanh.fromIndex(0),
    NguHanh.fromIndex(4),
    NguHanh.fromIndex(3),
    NguHanh.fromIndex(1),
  ];
  return data[sum - 1];
}
