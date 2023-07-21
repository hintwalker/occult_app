import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import '../sort/request_sort_value.dart';

SimpleTextGroup groupRequestBy(
  Request item,
  SortValue? sortOption,
  String Function(String) translate,
) {
  if (sortOption == null ||
      sortOption.name == RequestSortValue.sortByNameAsc ||
      sortOption.name == RequestSortValue.sortByNameDesc) {
    final firstLetter = item.name.substring(0, 1);
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
