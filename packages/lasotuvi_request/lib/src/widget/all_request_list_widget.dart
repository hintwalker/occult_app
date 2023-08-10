import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Request;
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'request_list_item_widget.dart';
import '../group/group_request_by.dart';
import '../query/request_where_clause.dart';
import '../sort/request_item_comparator.dart';
import '../sort/request_sort_options.dart';
import '../sort/request_sort_key.dart';

class AllRequestListWidget extends StatelessWidget {
  const AllRequestListWidget({
    super.key,
    required this.uid,
    required this.data,
    required this.translate,
    required this.colorScheme,
    // required this.onOpenSyncStatus,
    required this.onItemTap,
    required this.onSaveSortOption,
    required this.initSortValue,
  });
  final String? uid;
  final Iterable<Request> data;
  final SortValue? initSortValue;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  // final void Function({
  //   required Request request,
  //   required String? uid,
  // }) onOpenSyncStatus;
  final void Function(BuildContext, Request, String? uid) onItemTap;
  final void Function(String key, SortValue sortValue) onSaveSortOption;

  @override
  Widget build(BuildContext context) {
    final DataListController<Request> controller = DataListController(
      whereTest: (item, query) => requestWhereClause(item, query),
      sortOption: initSortValue,
      itemComparator: requestItemComparator,
      onSaveSortOption: (e) => onSaveSortOption(requestSortKey, e),
    );
    return FilterableWidget(
      colorScheme: colorScheme,
      translate: translate,
      sortOptions: requestSortOptions(translate),
      onSortOptionSelected: controller.setSortOption,
      onSearch: controller.runFilter,
      child: DataListContainer<Request, SimpleTextGroup>(
        data: data,
        colorScheme: colorScheme,
        translate: translate,
        order: controller.sortOption?.order ?? ListOrder.asc,
        controller: controller,
        groupBy: (e) => groupRequestBy(
          e,
          controller.sortOption,
          translate,
        ),
        itemBuilder: (item) => RequestListItemWidget(
          item,
          uid: uid,
          colorScheme: colorScheme,
          onTap: (request) => onItemTap(context, request, uid),
          // onSyncStatusTap: () => onOpenSyncStatus(
          //   request: item,
          //   uid: uid,
          // ),
          translate: translate,
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
