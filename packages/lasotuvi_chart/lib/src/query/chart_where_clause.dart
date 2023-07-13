import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Chart;
import 'package:tauari_list_view/tauari_list_view.dart';

bool chartWhereClause(Chart item, String query) {
  final RegExp regExp = RegExp(query, caseSensitive: false);
  final birthday = groupLabelFromDateTime(item.birthday, (e) => e);
  return item.name.contains(regExp) || birthday.label.contains(regExp);
}
