import 'ngu_hanh_rel_names.dart';

///
/// [rels] là json object, key là id của ngũ hành, value là mảng 5 phần tử.
///
/// Trong mảng 5 phần tử này, index là index của [items],
/// Giá trị của phần tử là index của ngũ hành: (0: Thủy, 1: Mộc, 2: Kim, 3: Thổ, 4: Hỏa)
///
/// Để lấy thông tin quan hệ giữa 2 ngũ hành (vd: ngũ hành 1 và ngũ hành 2):
/// - Tìm mảng 5 phần tử tương ứng với ngũ hành 1: array = nguHanhRelData['rels'][nguHanh1.index]
/// - Tìm index trong mảng 5 phần tử có giá trị là ngũ hành 2: indexRel = array.indexOf(nguHanh2.index)
/// - Tìm quan hệ: nguHanhRelData['items'][indexRel]
///
final nguHanhRelData = {
  'rels': {
    0: [0, 1, 4, 2, 3],
    1: [1, 4, 3, 0, 2],
    2: [2, 0, 1, 3, 4],
    3: [3, 2, 0, 4, 1],
    4: [4, 3, 2, 1, 0],
    5: [0, 1, 4, 2, 3],
    6: [0, 1, 4, 2, 3],
    7: [0, 1, 4, 2, 3],
    8: [0, 1, 4, 2, 3],
    9: [1, 4, 3, 0, 2],
    10: [1, 4, 3, 0, 2],
    11: [1, 4, 3, 0, 2],
    12: [1, 4, 3, 0, 2],
    13: [2, 0, 1, 3, 4],
    14: [2, 0, 1, 3, 4],
    15: [2, 0, 1, 3, 4],
    16: [2, 0, 1, 3, 4],
    17: [3, 2, 0, 4, 1],
    18: [3, 2, 0, 4, 1],
    19: [3, 2, 0, 4, 1],
    20: [3, 2, 0, 4, 1],
    21: [4, 3, 2, 1, 0],
    22: [4, 3, 2, 1, 0],
    23: [4, 3, 2, 1, 0],
    24: [4, 3, 2, 1, 0],
  },
  'items': {
    -1: {'index': -1, 'name': NguHanhRelNames.unknown},
    0: {'index': 0, 'name': NguHanhRelNames.tiHoa},
    1: {'index': 1, 'name': NguHanhRelNames.sinh},
    2: {'index': 2, 'name': NguHanhRelNames.khac},
    3: {'index': 3, 'name': NguHanhRelNames.duocSinhBoi},
    4: {'index': 4, 'name': NguHanhRelNames.biKhacBoi},
  }
};

// class NguHanhRelUnknown extends NguHanhRel {
//   const NguHanhRelUnknown() : super(index: -1, name: '-');
// }

// class TiHoa extends NguHanhRel {
//   const TiHoa() : super(index: 0, name: 'Tị hòa');
// }

// class Sinh extends NguHanhRel {
//   const Sinh() : super(index: 1, name: 'Sinh');
// }

// class Khac extends NguHanhRel {
//   const Khac() : super(index: 2, name: 'Khắc');
// }

// class DuocSinhBoi extends NguHanhRel {
//   const DuocSinhBoi() : super(index: 3, name: 'Được sinh bởi');
// }

// class BiKhacBoi extends NguHanhRel {
//   const BiKhacBoi() : super(index: 3, name: 'Bị khắc bởi');
// }
