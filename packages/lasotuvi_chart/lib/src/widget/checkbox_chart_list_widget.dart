import 'package:flutter/material.dart';
import 'package:tauari_sort/tauari_sort.dart';
import '../sort/chart_sort_key.dart';
import '../sort/chart_sort_options.dart';
import '../sort/selectable_chart_has_tags_comparator.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../group/group_selectable_charts_by.dart';
import '../query/chart_where_clause.dart';
import 'chart_list_item_widget.dart';

class CheckBoxChartListWidget extends StatelessWidget {
  const CheckBoxChartListWidget(
    this.data, {
    super.key,
    this.uid,
    required this.tagId,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    required this.onSubmit,
    required this.onCancel,
    required this.onSaveSortOption,
    required this.initSortValue,
  });
  final int tagId;
  final Iterable<ChartHasTags> data;
  final SortValue? initSortValue;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function(BuildContext context,
      Iterable<SelectableItem<ChartHasTags>> charts, String? uid) onSubmit;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, Chart chart, String? uid) onItemTap;
  final void Function(String key, SortValue sortOption) onSaveSortOption;

  @override
  Widget build(BuildContext context) {
    final CheckboxDataListController<ChartHasTags> controller =
        CheckboxDataListController<ChartHasTags>(
      whereTest: (item, query) => chartWhereClause(item.source, query),
      initSelected: initSelected,
      itemId: itemId,
      sortOption: initSortValue,
      itemComparator: selectableChartHasTagsComparator,
      onSaveSortOption: (e) => onSaveSortOption(chartSortKey, e),
    );

    return DataSelectionScaffold(
      colorScheme: colorScheme,
      translate: translate,
      onCancel: onCancel,
      onSubmit: (context) => onSubmit(
        context,
        controller.selected,
        uid,
      ),
      child: FilterableWidget(
        colorScheme: colorScheme,
        translate: translate,
        onSearch: controller.runFilter,
        sortOptions: chartSortOptions(translate),
        onSortOptionSelected: controller.setSortOption,
        child: CheckboxDataListContainer<ChartHasTags, SimpleTextGroup>(
          data: data,
          colorScheme: colorScheme,
          translate: translate,
          // order: controller.sortOption?.order ?? ListOrder.asc,
          controller: controller,
          groupBy: (e) =>
              groupSelectableChartsBy(e, controller.sortOption, translate),
          groupComparator: (e1, e2) => simpleGroupComparator(
            e1,
            e2,
            controller.sortOption,
          ),
          itemBuilder: (item) => ChartListItemWidget(
            item.source,
            uid: uid,
            translate: translate,
            colorScheme: colorScheme,
            onTap: onItemTap,
          ),
          groupSeperatorBuilder: (e) => BasicGroupSeperatorWidget(
            e,
            colorScheme: colorScheme,
          ),
          // whereTest: whereTest,
          // colorScheme: colorScheme,
          // translate: translate,
          // onCancel: onCancel,
          // onSubmit: (context, charts) => onSubmit(context, charts, uid),
          initSelected: initSelected,
          itemId: itemId,
          sort: true,
        ),
      ),
    );
  }

  // SimpleTextGroup groupBy(SelectableItem<ChartHasTags> item) {
  //   final firstLetter = item.data.source.name.substring(0, 1);
  //   return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  // }

  // int groupComparator(SimpleTextGroup item1, SimpleTextGroup item2) {
  //   return item1.label.compareTo(item2.label);
  // }

  int itemId(ChartHasTags item) => item.source.id;

  bool initSelected(ChartHasTags item) => item.carry
      .where(
        (element) => element.id == tagId,
      )
      .isNotEmpty;
}
