import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Request;
import 'package:tauari_list_view/tauari_list_view.dart';

bool requestWhereClause(Request item, String query) {
  final RegExp regExp = RegExp(query, caseSensitive: false);
  final birthday = groupLabelFromDateTime(item.birthday, (e) => e);
  final created = groupLabelFromDateTime(item.created, (e) => e);
  return item.name.contains(regExp) ||
      birthday.label.contains(regExp) ||
      created.label.contains(regExp);
}
