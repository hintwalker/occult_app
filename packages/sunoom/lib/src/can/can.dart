import '../calendar/luni_solar/is_next_luni_solar_day.dart';

import '../calendar/moment/moment.dart';
import '../calendar/simple_time.dart';
import '../chi/chi.dart';
import '../jdn/jdn_at_12h_ut.dart';
import '../ngu_hanh/am_duong_ngu_hanh.dart';
import 'can_data.dart';
import 'can_enum.dart';

class Can {
  final int index;
  final String name;
  final String short;
  final AmDuongNguHanh amDuongNguHanh;
  const Can({
    required this.index,
    required this.name,
    required this.short,
    required this.amDuongNguHanh,
  });
  const Can.initial({
    this.index = -1,
    this.name = '',
    this.short = '',
    this.amDuongNguHanh = const AmDuongNguHanh.initial(),
  });
  Cans get value => Cans.values.firstWhere((element) => element.name == name);

  // factory Can.unknown() = CanUnknown;
  // factory Can.giap() = CanGiap;
  // factory Can.at() = CanAt;
  // factory Can.binh() = CanBinh;
  // factory Can.dinh() = CanDinh;
  // factory Can.mau() = CanMau;
  // factory Can.ky() = CanKy;
  // factory Can.canh() = CanCanh;
  // factory Can.tan() = CanTan;
  // factory Can.nham() = CanNham;
  // factory Can.quy() = CanQuy;

  factory Can.ofLuniYear(int year) {
    return Can.fromIndex((year + 6) % 10);
  }

  factory Can.fromEnum(Cans cans) => Can.fromIndex(cans.index);

  factory Can.fromMap(Map<String, Object> map) {
    return Can(
      index: map['index'] as int,
      name: map['name'] as String,
      short: map['short'] as String,
      amDuongNguHanh: AmDuongNguHanh.fromIndex(map['amDuongNguHanh'] as int),
    );
  }

  factory Can.fromIndex(int index) {
    final data = canData[index]!;
    return Can.fromMap(data);
    // switch (index) {
    //   case 0:
    //     return Can.giap();
    //   case 1:
    //     return Can.at();
    //   case 2:
    //     return Can.binh();
    //   case 3:
    //     return Can.dinh();
    //   case 4:
    //     return Can.mau();
    //   case 5:
    //     return Can.ky();
    //   case 6:
    //     return Can.canh();
    //   case 7:
    //     return Can.tan();
    //   case 8:
    //     return Can.nham();
    //   case 9:
    //     return Can.quy();
    //   default:
    //     return Can.unknown();
    // }
  }

  factory Can.ofLuniMonth({required int year, required int month}) {
    return Can.fromIndex((year * 12 + month + 3) % 10);
  }

  factory Can.ofDay(Moment moment) {
    int jdn = jdnAt12hUt(
      moment.gregorian.year,
      moment.gregorian.month,
      moment.gregorian.day,
    ).toInt();
    if (moment.isNextLuniDay()) {
      jdn += 1;
    }
    return Can.fromIndex((jdn + 9) % 10);
  }

  factory Can.ofTime({required SimpleTime time, required Can canOfDay}) {
    final chiOfTime = Chi.ofTime(time);
    return Can.fromChiOfTime(chiOfTime: chiOfTime, canOfDay: canOfDay);
  }

  factory Can.fromChiOfTime({required Chi chiOfTime, required Can canOfDay}) {
    final data = [
      0,
      2,
      4,
      6,
      8,
      0,
      2,
      4,
      6,
      8,
    ];
    final firstCanIndex = data[canOfDay.index];
    // final delta = chiOfTime.index - Chi.tys().index;
    int result = firstCanIndex + chiOfTime.index;
    if (result > 9) {
      result -= 10;
    }
    return Can.fromIndex(result);
  }
}
