import 'package:sunoom/sunoom.dart';

import 'cuc.dart';

extension NguHanhFromCuc on Cuc {
  NguHanh get nguHanh {
    return when(
      unknown: () => NguHanh.fromIndex(-1),
      thuy2Cuc: () => NguHanh.fromIndex(0),
      moc3Cuc: () => NguHanh.fromIndex(1),
      kim4Cuc: () => NguHanh.fromIndex(2),
      tho5Cuc: () => NguHanh.fromIndex(3),
      hoa6Cuc: () => NguHanh.fromIndex(4),
    );
  }
}
