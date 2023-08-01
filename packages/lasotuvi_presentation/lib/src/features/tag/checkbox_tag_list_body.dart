import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../helper/storage_helper.dart';
import 'navigation/tag_navigation.dart';
import '../auth/user_auth_depended_state.dart';

class CheckboxTagListBody extends ConsumerStatefulWidget {
  const CheckboxTagListBody(this.chart, {super.key});

  final Chart chart;

  @override
  ConsumerState<CheckboxTagListBody> createState() =>
      _CheckboxTagListBodyState();
}

class _CheckboxTagListBodyState
    extends UserAuthDependedState<CheckboxTagListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const LoadingWidget()
        : CheckboxTagListModal(
            translate: translate,
            colorScheme: LasotuviAppStyle.colorScheme,
            child: BasicStreamBuilder(
              stream: ref.watch(tagHasChartsListControllerProvider).stream(uid),
              child: (tagHasCharts) => BasicFutureBuilder(
                future: SortHelper.getSortOption(tagSortKey),
                child: (sortValue) => CheckBoxTagListWidget(
                  tagHasCharts ?? [],
                  uid: uid,
                  initSortValue: sortValue,
                  translate: translate,
                  colorScheme: LasotuviAppStyle.colorScheme,
                  chartId: widget.chart.id,
                  onCancel: onCancel,
                  onSubmit: onSubmit,
                  onItemTap: (context, tag, _) =>
                      TagNavigation.openTagDetail(context: context, tag: tag),
                  onOpenTagCreation: (context) =>
                      TagNavigation.openTagCreationScreen(
                    context,
                    (tag) => doAfterCreation(tag, widget.chart),
                  ),
                  openSyncOptions: (uid, tag) =>
                      StorageHelper.showOptionsModal<Tag>(
                    tag,
                    uid: uid,
                    context: context,
                    ref: ref,
                  ),
                  onSaveSortOption: (key, value) =>
                      SortHelper.saveSortOption(key, value),
                ),
              ),
            ),
          );
  }

  Future<void> doAfterCreation(Tag tag, Chart chart) async {
    await ref.read(connectChartsToTagProvider).call(
      uid: uid,
      right: tag,
      lefts: [chart],
    );
    setState(() {});
  }

  void onCancel(BuildContext context) {
    context.pop();
  }

  Future<void> onSubmit(BuildContext context,
      Iterable<SelectableItem<TagHasCharts>> tagHasCharts, String? uid) async {
    final connectedTags = tagHasCharts
        .where(
          (element) => !element.initSelected && element.selected,
        )
        .map((e) => e.data.source);

    final disConnectedTags = tagHasCharts
        .where(
          (element) => element.initSelected && !element.selected,
        )
        .map((e) => e.data.source);
    if (connectedTags.isNotEmpty) {
      await ref
          .read(connectTagsToChartProvider)
          .call(uid: uid, left: widget.chart, rights: connectedTags);
    }

    if (disConnectedTags.isNotEmpty) {
      await ref
          .read(disConnectTagsFromChartProvider)
          .call(uid: uid, left: widget.chart, rights: disConnectedTags);
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }
    });
  }
}
