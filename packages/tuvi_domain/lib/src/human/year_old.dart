import 'package:sunoom/sunoom.dart';

int yearOld({required Moment birthday, required Moment now}) {
  // final duration = now.difference(birthday);
  // Todo: Need improve
  final yearBirthday = birthday.luniSolarDate.year;
  final yearNow = now.luniSolarDate.year;
  final delta = yearNow - yearBirthday;
  if (now.luniSolarDate.month < birthday.luniSolarDate.month) {
    return delta;
  } else if (now.luniSolarDate.month > birthday.luniSolarDate.month) {
    return delta + 1;
  } else {
    if (now.luniSolarDate.day < birthday.luniSolarDate.day) {
      return delta;
    } else if (now.luniSolarDate.day > birthday.luniSolarDate.day) {
      return delta + 1;
    } else {
      if (now.time.hour < birthday.time.hour) {
        return delta;
      } else if (now.time.hour > birthday.time.hour) {
        return delta + 1;
      } else {
        if (now.time.minute < birthday.time.minute) {
          return delta;
        } else {
          return delta + 1;
        }
      }
    }
  }
}
