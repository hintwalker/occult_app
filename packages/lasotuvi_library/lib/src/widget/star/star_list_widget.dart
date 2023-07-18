import 'package:flutter/material.dart';
import 'package:lasotuvi_library/src/group/group_star_by.dart';
import 'package:lasotuvi_library/src/sort/star_sort_options.dart';
import 'package:tauari_list_view/tauari_list_view.dart';

import '../../entity/star_item.dart';
import '../../query/star_where_clause.dart';
import '../../sort/star_item_comparator.dart';
import '../../sort/star_sort_key.dart';
import 'star_item_widget.dart';

class StarListWidget extends StatelessWidget {
  const StarListWidget({
    super.key,
    required this.data,
    required this.onItemTap,
    required this.colorScheme,
    required this.translate,
    required this.onSaveSortOption,
    required this.initSortValue,
  });
  final Iterable<StarItem> data;
  final void Function(StarItem) onItemTap;
  final SortValue? initSortValue;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(String key, SortValue sortOption) onSaveSortOption;

  @override
  Widget build(BuildContext context) {
    final DataListController<StarItem> controller = DataListController(
        whereTest: (item, query) => starWhereClause(item, query),
        sortOption: initSortValue,
        itemComparator: starItemComparator,
        onSaveSortOption: (event) => onSaveSortOption(starSortKey, event));
    return FilterableWidget(
      colorScheme: colorScheme,
      translate: translate,
      onSearch: controller.runFilter,
      onSortOptionSelected: controller.setSortOption,
      sortOptions: starSortOptions(translate),
      child: DataListContainer<StarItem, SimpleTextGroup>(
        data: data,
        controller: controller,
        itemBuilder: (item) => StarItemWidget(
          item,
          onTap: onItemTap,
          translate: translate,
        ),
        actionButtons: const [],
        groupBy: (item) => groupStarBy(item, initSortValue),
        groupComparator: (group1, group2) => simpleGroupComparator(
          group1,
          group2,
          controller.sortOption,
        ),
        groupSeperatorBuilder: (p0) =>
            BasicGroupSeperatorWidget(p0, colorScheme: colorScheme),
        seperator: const Divider(
          height: 1.0,
          thickness: 1.0,
        ),
      ),
    );
    // return ListView.separated(
    //   itemBuilder: (_, index) => StarItemWidget(
    //     data.elementAt(index),
    //     onTap: onItemTap,
    //     translate: translate,
    //   ),
    //   separatorBuilder: (_, index) => const Divider(
    //     height: 1,
    //     thickness: 1,
    //   ),
    //   itemCount: data.length,
    // );
  }
}
