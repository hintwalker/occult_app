import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Chart;
import 'package:tauari_list_view/tauari_list_view.dart'
    show groupLabelFromDateTime;

bool chartWhereClause(Chart item, String query,
    {required String Function(String) translate}) {
  final RegExp regExp = RegExp(query, caseSensitive: false, unicode: true);
  final birthday = groupLabelFromDateTime(item.birthday, translate);
  return item.name.contains(regExp) || birthday.label.contains(regExp);
}
