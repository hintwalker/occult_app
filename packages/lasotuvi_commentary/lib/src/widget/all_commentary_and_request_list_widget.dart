import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart'
    show Commentary, CommentaryAndRequest;
import 'package:tauari_list_view/tauari_list_view.dart';

import 'commentary_and_request_list_item_widget.dart';
import '../group/group_commentary_and_request_by.dart';
import '../query/commentary_and_request_where_clause.dart';
import '../sort/commentary_and_request_comparator.dart';
import '../sort/commentary_and_request_sort_options.dart';
import '../sort/commentary_sort_key.dart';

class AllCommentaryAndRequestListWidget extends StatelessWidget {
  const AllCommentaryAndRequestListWidget({
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
  final Iterable<CommentaryAndRequest> data;
  final SortValue? initSortValue;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function({
    required Commentary commentary,
    required String? uid,
  }) onOpenSyncStatus;
  final void Function(BuildContext, Commentary, String? uid) onItemTap;
  final void Function(String key, SortValue sortValue) onSaveSortOption;

  @override
  Widget build(BuildContext context) {
    final DataListController<CommentaryAndRequest> controller =
        DataListController(
      whereTest: (item, query) => commentaryAndRequestWhereClause(item, query),
      sortOption: initSortValue,
      itemComparator: commentaryAndRequestComparator,
      onSaveSortOption: (e) => onSaveSortOption(commentarySortKey, e),
    );
    return FilterableWidget(
      colorScheme: colorScheme,
      translate: translate,
      sortOptions: commentaryAndRequestSortOptions(translate),
      onSortOptionSelected: controller.setSortOption,
      onSearch: controller.runFilter,
      child: DataListContainer<CommentaryAndRequest, SimpleTextGroup>(
        data: data,
        // order: controller.sortOption?.order ?? ListOrder.asc,
        controller: controller,
        groupBy: (e) => groupCommentaryAndRequestBy(
          e,
          controller.sortOption,
          translate,
        ),
        itemBuilder: (item) => CommentaryAndRequestListItemWidget(
          item,
          uid: uid,
          colorScheme: colorScheme,
          onTap: (commentary) => onItemTap(context, commentary, uid),
          onSyncStatusTap: () => onOpenSyncStatus(
            commentary: item.entity1!,
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
