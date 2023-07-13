import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_tag/src/group/group_tags_by.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

SimpleTextGroup groupSelectableTagHasChartsBy(
  SelectableItem<TagHasCharts> item,
  SortValue? sortOption,
  String Function(String) translate,
) =>
    groupTagsBy(item.data.source, sortOption, translate);
