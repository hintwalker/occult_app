import 'package:flutter/material.dart';
import 'package:lasotuvi_chart/src/sort/chart_sort_key.dart';
import '../group/group_chart_has_tags_by.dart';
import '../query/chart_where_clause.dart';
import '../sort/chart_has_tags_comparator.dart';
import '../sort/chart_sort_options.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'chart_has_tags_list_item.widget.dart';

class AllChartListWidget extends StatelessWidget {
  const AllChartListWidget(
    this.data, {
    super.key,
    required this.translate,
    required this.colorScheme,
    required this.onOpenTag,
    required this.onOpenNote,
    required this.onOpenMore,
    required this.onItemTap,
    required this.onOpenSyncStatus,
    // required this.storageOptionsModalBuilder,
    this.slidable = true,
    required this.uid,
    required this.onSaveSortOption,
    required this.initSortValue,
  });
  final String? uid;
  final Iterable<ChartHasTags> data;
  final SortValue? initSortValue;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(String key, SortValue sortOption) onSaveSortOption;
  final void Function(BuildContext, Chart, String? uid) onOpenTag;
  final void Function(BuildContext, Chart, String? uid) onOpenNote;
  final void Function(BuildContext, Chart, String? uid) onOpenMore;
  final void Function(BuildContext, Chart, String? uid) onItemTap;
  final bool slidable;

  final void Function({
    required Chart chart,
    required String? uid,
  }) onOpenSyncStatus;
  // Iterable<ActionButton<ChartHasTags>> buttons() => [
  //       ActionButton<ChartHasTags>(
  //         onPressed: (context, item) => onOpenTag(context, item.source, uid),
  //         background: colorScheme.background,
  //         foreground: colorScheme.onBackground,
  //         icon: Icons.label_outline,
  //       ),
  //       ActionButton<ChartHasTags>(
  //         onPressed: (context, item) => onOpenNote(context, item.source, uid),
  //         background: colorScheme.background,
  //         foreground: colorScheme.onBackground,
  //         icon: Icons.sticky_note_2_outlined,
  //       ),
  //       ActionButton<ChartHasTags>(
  //         onPressed: (context, item) => onOpenMore(context, item.source, uid),
  //         background: colorScheme.background,
  //         foreground: colorScheme.onBackground,
  //         icon: Icons.more_vert,
  //       )
  //     ];

  @override
  Widget build(BuildContext context) {
    final DataListController<ChartHasTags> controller = DataListController(
        whereTest: (item, query) => chartWhereClause(item.source, query),
        sortOption: initSortValue,
        itemComparator: chartHasTagsComparator,
        onSaveSortOption: (event) => onSaveSortOption(chartSortKey, event));
    return FilterableWidget(
      colorScheme: colorScheme,
      translate: translate,
      sortOptions: chartSortOptions(translate),
      onSortOptionSelected: controller.setSortOption,
      onSearch: controller.runFilter,
      child: DataListContainer<ChartHasTags, SimpleTextGroup>(
        data: data,
        // order: controller.sortOption?.order ?? ListOrder.asc,
        controller: controller,
        groupBy: (e) => groupChartHasTagsBy(
          e,
          controller.sortOption,
          translate,
        ),
        itemBuilder: (item) => ChartHasTagsListItem(
          item,
          uid: uid,
          translate: translate,
          colorScheme: colorScheme,
          onTap: onItemTap,
          onSyncStatusTap: () => onOpenSyncStatus(
            chart: item.source,
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
