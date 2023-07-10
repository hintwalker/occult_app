import 'package:flutter/material.dart';
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
    required this.storageOptionsModalBuilder,
    this.slidable = true,
    required this.uid,
  });
  final Iterable<ChartHasTags> data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onOpenTag;
  final void Function(BuildContext, Chart, String? uid) onOpenNote;
  final void Function(BuildContext, Chart, String? uid) onOpenMore;
  final void Function(BuildContext, Chart, String? uid) onItemTap;
  final bool slidable;
  final String? uid;
  final Widget Function(Chart, {String? uid, String? syncStatus})
      storageOptionsModalBuilder;

  SimpleTextGroup groupBy(ChartHasTags item) {
    final firstLetter = item.source.name.substring(0, 1);
    return SimpleTextGroup(firstLetter, firstLetter.toUpperCase());
  }

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

  bool whereTest(ChartHasTags item, String query) {
    return item.source.name.toLowerCase().contains(query.trim().toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return DataListView<ChartHasTags, SimpleTextGroup>(
      data,
      groupBy: groupBy,
      itemBuilder: (item) => ChartHasTagsListItem(
        item,
        uid: uid,
        translate: translate,
        colorScheme: colorScheme,
        onTap: onItemTap,
        onSyncStatusTap: () => openStorageOptions(context, item.source),
      ),
      groupSeperatorBuilder: (p0) => BasicGroupSeperatorWidget(
        p0,
        colorScheme: colorScheme,
      ),
      buttons: const [],
      whereTest: whereTest,
      translate: translate,
      slidable: slidable,
    );
  }

  void openStorageOptions(BuildContext context, Chart item) {
    showModalBottomSheet(
      context: context,
      builder: (_) =>
          // SingleChildScrollView(
          //       child:
          storageOptionsModalBuilder(item,
              syncStatus: item.syncStatus, uid: uid),
      // )
    );
  }
}