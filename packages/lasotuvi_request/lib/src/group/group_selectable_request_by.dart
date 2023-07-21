import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'group_request_by.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

SimpleTextGroup groupSelectableRequestBy(
  SelectableItem<Request> item,
  SortValue? sortOption,
  String Function(String) translate,
) =>
    groupRequestBy(item.data, sortOption, translate);
