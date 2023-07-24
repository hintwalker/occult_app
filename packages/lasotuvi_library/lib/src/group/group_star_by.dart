import 'package:tauari_sort/tauari_sort.dart';

import '../entity/star_item.dart';
import 'package:tauari_list_view/tauari_list_view.dart' show SimpleTextGroup;

SimpleTextGroup groupStarBy(
  StarItem item,
  SortValue? sortOption,
) {
  final firstLetter = item.name.substring(0, 1);
  return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
}
