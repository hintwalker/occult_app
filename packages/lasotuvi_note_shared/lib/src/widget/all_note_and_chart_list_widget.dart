import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart' show Note, NoteAndChart;
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';

import 'note_and_chart_item_widget.dart';
import '../group/group_note_and_chart_by.dart';
import '../query/note_and_chart_where_clause.dart';
import '../sort/note_and_chart_comparator.dart';
import '../sort/note_and_chart_sort_options.dart';
import '../sort/note_sort_key.dart';

class AllNoteAndChartListWidget extends StatelessWidget {
  const AllNoteAndChartListWidget({
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
  final Iterable<NoteAndChart> data;
  final SortValue? initSortValue;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function({
    required Note note,
    required String? uid,
  }) onOpenSyncStatus;
  final void Function(BuildContext, Note, String? uid) onItemTap;
  final void Function(String key, SortValue sortValue) onSaveSortOption;

  @override
  Widget build(BuildContext context) {
    final DataListController<NoteAndChart> controller = DataListController(
      whereTest: (item, query) => noteAndChartWhereClause(item, query),
      sortOption: initSortValue,
      itemComparator: noteAndChartComparator,
      onSaveSortOption: (e) => onSaveSortOption(noteSortKey, e),
    );
    return FilterableWidget(
      colorScheme: colorScheme,
      translate: translate,
      sortOptions: noteAndChartSortOptions(translate),
      onSortOptionSelected: controller.setSortOption,
      onSearch: controller.runFilter,
      child: DataListContainer<NoteAndChart, SimpleTextGroup>(
        data: data,
        // order: controller.sortOption?.order ?? ListOrder.asc,
        controller: controller,
        groupBy: (e) => groupNoteAndChartBy(
          e,
          controller.sortOption,
          translate,
        ),
        itemBuilder: (item) => NoteAndChartItemWidget(
          item,
          uid: uid,
          colorScheme: colorScheme,
          onTap: (note) => onItemTap(context, note, uid),
          onSyncStatusTap: () => onOpenSyncStatus(
            note: item.entity1!,
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
