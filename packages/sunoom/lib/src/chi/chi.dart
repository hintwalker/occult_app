import '../calendar/luni_solar/luni_solar_date.dart';
import '../calendar/simple_date.dart';
import '../calendar/simple_time.dart';
import '../calendar/time/standardlize_to_24h.dart';
import '../conversion/luni_solar_2_gregorian.dart';
import '../jdn/jdn_at_12h_ut.dart';
import '../ngu_hanh/ngu_hanh.dart';
import 'chi_data.dart';
import 'chi_enum.dart';

class Chi {
  final int index;
  final String name;
  final NguHanh nguHanh;
  const Chi({
    required this.index,
    required this.name,
    required this.nguHanh,
  });

  const Chi.initial(
      {this.index = -1,
      this.name = '',
      this.nguHanh = const NguHanh.initial()});

  Chies get value => Chies.values.firstWhere((element) => element.name == name);

  // factory Chi.unknown() = ChiUnknown;
  // factory Chi.tys() = ChiTys;
  // factory Chi.suu() = ChiSuu;
  // factory Chi.dan() = ChiDan;
  // factory Chi.mao() = ChiMao;
  // factory Chi.thin() = ChiThin;
  // factory Chi.tyj() = ChiTyj;
  // factory Chi.ngo() = ChiNgo;
  // factory Chi.mui() = ChiMui;
  // factory Chi.than() = ChiThan;
  // factory Chi.dau() = ChiDau;
  // factory Chi.tuat() = ChiTuat;
  // factory Chi.hoi() = ChiHoi;

  factory Chi.ofLuniYear(int year) {
    return Chi.fromIndex((year + 8) % 12);
  }

  factory Chi.fromEnum(Chies chi) => Chi.fromIndex(chi.index);

  factory Chi.fromIndex(int index) {
    return Chi.fromMap(chiData[index]!);
    // switch (index) {
    //   case 0:
    //     return Chi.tys();
    //   case 1:
    //     return Chi.suu();
    //   case 2:
    //     return Chi.dan();
    //   case 3:
    //     return Chi.mao();
    //   case 4:
    //     return Chi.thin();
    //   case 5:
    //     return Chi.tyj();
    //   case 6:
    //     return Chi.ngo();
    //   case 7:
    //     return Chi.mui();
    //   case 8:
    //     return Chi.than();
    //   case 9:
    //     return Chi.dau();
    //   case 10:
    //     return Chi.tuat();
    //   case 11:
    //     return Chi.hoi();
    //   default:
    //     return Chi.unknown();
    // }
  }

  factory Chi.fromMap(Map<String, Object> map) {
    return Chi(
      index: map['index'] as int,
      name: map['name'] as String,
      nguHanh: NguHanh.fromIndex(map['nguHanh'] as int),
    );
  }

  factory Chi.ofLuniMonth(int month) {
    return Chi.fromIndex((month + 1) % 12);
  }

  factory Chi.ofGregorianDay({
    required SimpleDate date,
    SimpleTime? time,
  }) {
    var jdn = jdnAt12hUt(date.year, date.month, date.day).toInt();
    if (time?.hour == 23) {
      jdn += 1;
    }
    return Chi.fromIndex((jdn + 1) % 12);
  }

  factory Chi.ofLuniSolarDay({
    required LuniSolarDate date,
    SimpleTime? time,
  }) {
    final gregorian = luniSolar2Gregorian(date);
    return Chi.ofGregorianDay(date: gregorian, time: time);
  }

  factory Chi.ofTime(SimpleTime time, [List<int>? data]) {
    final timeData = data ??
        [
          0,
          1,
          1,
          2,
          2,
          3,
          3,
          4,
          4,
          5,
          5,
          6,
          6,
          7,
          7,
          8,
          8,
          9,
          9,
          10,
          10,
          11,
          11,
          0
        ];
    return Chi.fromIndex(timeData[standardlizeTo24h(time.hour)]);
  }

  @override
  bool operator ==(Object? other) {
    if (other is Chi) {
      return other.index == index;
    }
    return false;
  }

  @override
  int get hashCode => index.hashCode;
}
