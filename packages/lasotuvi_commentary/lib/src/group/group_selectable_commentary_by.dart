import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'group_commentary_by.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

SimpleTextGroup groupSelectableCommentarysBy(
  SelectableItem<Commentary> item,
  SortValue? sortOption,
  String Function(String) translate,
) =>
    groupCommentaryBy(item.data, sortOption, translate);
