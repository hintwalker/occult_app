import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:lasotuvi_tag/src/query/tag_where_clause.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';

import '../group/group_tags_by.dart';
import '../sort/tag_item_comparator.dart';
import '../sort/tag_sort_options.dart';

class AllTagListWidget extends StatelessWidget {
  const AllTagListWidget({
    super.key,
    required this.uid,
    required this.data,
    required this.translate,
    required this.colorScheme,
    required this.onOpenSyncStatus,
    required this.onItemTap,
    required this.onSaveSortOption,
    required this.initSortValue,
  });
  final String? uid;
  final Iterable<Tag> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final SortValue? initSortValue;
  final void Function({
    required Tag tag,
    required String? uid,
  }) onOpenSyncStatus;
  final void Function(BuildContext context, Tag tag, String? uid) onItemTap;
  final void Function(String key, SortValue sortValue) onSaveSortOption;

  @override
  Widget build(BuildContext context) {
    final DataListController<Tag> controller = DataListController(
      whereTest: tagWhereClause,
      sortOption: initSortValue,
      itemComparator: tagItemComparator,
      onSaveSortOption: (e) => onSaveSortOption(tagSortKey, e),
    );
    return FilterableWidget(
      colorScheme: colorScheme,
      translate: translate,
      sortOptions: tagSortOptions(translate),
      onSortOptionSelected: controller.setSortOption,
      onSearch: controller.runFilter,
      child: DataListContainer<Tag, SimpleTextGroup>(
        data: data,
        // order: controller.sortOption?.order ?? ListOrder.asc,
        controller: controller,
        groupBy: (e) => groupTagsBy(
          e,
          controller.sortOption,
          translate,
        ),
        itemBuilder: (item) => TagListItemWidget(
          item,
          uid: uid,
          translate: translate,
          colorScheme: colorScheme,
          onTap: onItemTap,
          onSyncStatusTap: () => onOpenSyncStatus(
            tag: item,
            uid: uid,
          ),
        ),
        groupComparator: (p0, p1) => simpleGroupComparator(
          p0,
          p1,
          controller.sortOption,
        ),
        groupSeperatorBuilder: (p0) => BasicGroupSeperatorWidget(
          p0,
          colorScheme: colorScheme,
        ),
        actionButtons: const [],
      ),
    );
  }
}
