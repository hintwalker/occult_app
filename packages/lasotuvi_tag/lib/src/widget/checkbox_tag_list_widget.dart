import 'package:flutter/material.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_tag/src/sort/selectable_tag_has_charts_comparator.dart';
import 'package:tauari_sort/tauari_sort.dart';
import '../group/group_selectable_tag_has_charts_by.dart';
import '../sort/tag_sort_key.dart';
import '../sort/tag_sort_options.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'tag_list_item_widget.dart';

class CheckBoxTagListWidget extends StatelessWidget {
  const CheckBoxTagListWidget(
    this.data, {
    super.key,
    required this.uid,
    required this.chartId,
    required this.translate,
    required this.colorScheme,
    required this.onItemTap,
    required this.onSubmit,
    required this.onCancel,
    required this.onOpenTagCreation,
    required this.openSyncOptions,
    required this.onSaveSortOption,
    required this.initSortValue,
  });
  final int chartId;
  final Iterable<TagHasCharts> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function(BuildContext context,
      Iterable<SelectableItem<TagHasCharts>> tags, String? uid) onSubmit;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context, Tag tag, String? uid) onItemTap;
  final void Function(BuildContext context) onOpenTagCreation;
  final void Function(String? uid, Tag tag) openSyncOptions;
  final void Function(String key, SortValue sortValue) onSaveSortOption;
  final SortValue? initSortValue;

  @override
  Widget build(BuildContext context) {
    final CheckboxDataListController<TagHasCharts> controller =
        CheckboxDataListController<TagHasCharts>(
      whereTest: whereTest,
      initSelected: initSelected,
      itemId: itemId,
      sortOption: initSortValue,
      itemComparator: selectableTagHasChartsComparator,
      onSaveSortOption: (e) => onSaveSortOption(tagSortKey, e),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 4.0,
        ),
        ElevatedButton.icon(
          onPressed: () => onOpenTagCreation(context),
          icon: const Icon(Icons.add),
          label: Text(
            translate('createTag'),
          ),
        ),
        const SizedBox(
          height: 4.0,
        ),
        Expanded(
          child: DataSelectionScaffold(
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
              onSearch: (query) => controller.runFilter(query),
              sortOptions: tagSortOptions(translate),
              onSortOptionSelected: (event) => controller.setSortOption(event),
              child: CheckboxDataListContainer<TagHasCharts, SimpleTextGroup>(
                data: data,
                colorScheme: colorScheme,
                translate: translate,
                // order: controller.sortOption?.order ?? ListOrder.asc,
                initSelected: initSelected,
                itemId: itemId,
                controller: controller,
                groupBy: (e) => groupSelectableTagHasChartsBy(
                    e, controller.sortOption, translate),
                groupComparator: (e1, e2) => simpleGroupComparator(
                  e1,
                  e2,
                  controller.sortOption,
                ),
                groupSeperatorBuilder: (label) => BasicGroupSeperatorWidget(
                  label,
                  colorScheme: colorScheme,
                ),
                itemBuilder: (item) => TagListItemWidget(
                  item.source,
                  uid: uid,
                  translate: translate,
                  colorScheme: colorScheme,
                  onTap: onItemTap,
                  onSyncStatusTap: () => openSyncOptions(
                    uid,
                    item.source,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool initSelected(TagHasCharts item) => item.carry
      .where(
        (element) => element.id == chartId,
      )
      .isNotEmpty;

  int itemId(TagHasCharts item) => item.source.id;

  // SimpleTextGroup groupBy(
  //     SelectableItem<TagHasCharts> item, SortOption? sortOption) {
  //   if (sortOption == null ||
  //       sortOption.value == TagSortValue.sortByTitleAsc ||
  //       sortOption.value == TagSortValue.sortByTitleDesc) {
  //     final firstLetter = item.data.source.title.substring(0, 1);
  //     return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  //   } else {
  //     final created = item.data.source.created;
  //     final moment = created
  //         .toMoment(TimeZone(offsetInHour: created.timeZoneOffset.inHours));
  //     final label =
  //         '${moment.toGregorianDateString()} (${moment.toLuniSolarDateString(canName: (can) => translate(can.name), chiName: (chi) => translate(chi.name))})';
  //     return SimpleTextGroup(created.millisecondsSinceEpoch.toString(), label);
  //   }
  // }

  bool whereTest(TagHasCharts item, String query) {
    return item.source.title.toLowerCase().contains(query.trim().toLowerCase());
  }
}
