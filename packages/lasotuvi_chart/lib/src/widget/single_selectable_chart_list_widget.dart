import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';
import '../query/chart_where_clause.dart';
import '../sort/chart_item_comparator.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import '../group/group_chart_by.dart';
import '../sort/chart_sort_key.dart';
import '../sort/chart_sort_options.dart';
import 'chart_list_item_widget.dart';

class SingleSelectableChartListWidget extends StatelessWidget {
  const SingleSelectableChartListWidget(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    required this.uid,
    required this.onSaveSortOption,
    required this.initSortValue,
  });
  final SortValue? initSortValue;
  final Iterable<Chart> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onItemTap;
  final String? uid;
  final void Function(String key, SortValue sortOption) onSaveSortOption;

  @override
  Widget build(BuildContext context) {
    final controller = DataListController<Chart>(
      whereTest: (chart, query) => chartWhereClause(
        chart,
        query,
        translate: translate,
      ),
      sortOption: initSortValue,
      itemComparator: chartItemComparator,
      onSaveSortOption: (e) => onSaveSortOption(chartSortKey, e),
    );
    return FilterableWidget(
      colorScheme: colorScheme,
      translate: translate,
      sortOptions: chartSortOptions(translate),
      onSortOptionSelected: controller.setSortOption,
      onSearch: controller.runFilter,
      child: DataListContainer<Chart, SimpleTextGroup>(
        data: data,
        colorScheme: colorScheme,
        translate: translate,
        order: controller.sortOption?.order ?? ListOrder.asc,
        controller: controller,
        groupBy: (e) => groupChartsBy(
          e,
          controller.sortOption,
          translate,
        ),
        itemBuilder: (item) => ChartListItemWidget(
          item,
          uid: uid,
          translate: translate,
          colorScheme: colorScheme,
          onTap: onItemTap,
        ),
        groupSeperatorBuilder: (p0) => BasicGroupSeperatorWidget(
          p0,
          colorScheme: colorScheme,
        ),
        groupComparator: (p0, p1) => simpleGroupComparator(
          p0,
          p1,
          controller.sortOption,
        ),
        actionButtons: const [],
        // whereTest: whereTest,
        // translate: translate,
        // slidable: false,
      ),
    );
  }

  SimpleTextGroup groupBy(Chart item) {
    final firstLetter = item.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }
}
