import 'group_chart_by.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

SimpleTextGroup groupChartHasTagsBy(
  ChartHasTags item,
  SortValue? sortOption,
  String Function(String) translate,
) =>
    groupChartsBy(item.source, sortOption, translate);
