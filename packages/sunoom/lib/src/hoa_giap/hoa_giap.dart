import '../can/can.dart';
import '../chi/chi.dart';
import '../ngu_hanh/ngu_hanh.dart';
import 'hoa_giap_data.dart';
import 'hoa_giap_enum.dart';
import 'hoa_giap_index_data.dart';

class HoaGiap {
  final int index;
  final String name;
  final NguHanh nguHanh;
  const HoaGiap({
    required this.index,
    required this.name,
    required this.nguHanh,
  });
  // const factory HoaGiap.unknown() = HoaGiapUnknown;
  // const factory HoaGiap.haiTrungKim() = HaiTrungKim;
  factory HoaGiap.fromCanChi(Can can, Chi chi) {
    final index = hoaGiapIndexData[can.index]![chi.index]!;
    return HoaGiap.fromIndex(index);
  }

  factory HoaGiap.fromIndex(int index) {
    return HoaGiap.fromMap(hoaGiapData[index]!);
    // switch (index) {
    //   case 0:
    //     return HoaGiap.haiTrungKim();

    //   default:
    //     return HoaGiap.unknown();
    // }
  }

  factory HoaGiap.fromEnum(HoaGiaps hoaGiap) =>
      HoaGiap.fromIndex(hoaGiap.index);

  factory HoaGiap.fromMap(Map<String, Object> map) {
    return HoaGiap(
      index: map['index'] as int,
      name: map['name'] as String,
      nguHanh: NguHanh.fromString(map['nguHanh'] as String),
    );
  }

  static int findIndexForTuanNavigation(Can canOfYear, Chi chiOfYear) {
    final row = hoaGiapIndexData[canOfYear.index];
    if (row == null) {
      return -1;
    }
    var index = 0;
    for (var element in row.keys) {
      if (element == chiOfYear.index) {
        return index;
      }
      index++;
    }
    return -1;
  }
}
