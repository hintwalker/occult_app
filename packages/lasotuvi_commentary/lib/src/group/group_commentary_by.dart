import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';

import '../sort/commentary_sort_value.dart';

SimpleTextGroup groupCommentaryBy(
  Commentary item,
  SortValue? sortOption,
  String Function(String) translate,
) {
  if (sortOption == null ||
      sortOption.name == CommentarySortValue.sortByTitleAsc ||
      sortOption.name == CommentarySortValue.sortByTitleDesc) {
    final firstLetter = item.title.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  } else {
    final created = item.created;
    final moment = created
        .toMoment(TimeZone(offsetInHour: created.timeZoneOffset.inHours));
    final label =
        '${moment.toGregorianDateString()} (${moment.toLuniSolarDateString(canName: (can) => translate(can.name), chiName: (chi) => translate(chi.name))})';
    return SimpleTextGroup(created.millisecondsSinceEpoch.toString(), label);
  }
}
