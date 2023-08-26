import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

import '../navigation/chart_navigation.dart';
import '../../auth/user_auth_depended_state.dart';

class CheckboxChartListBody extends ConsumerStatefulWidget {
  const CheckboxChartListBody(
    this.tag, {
    super.key,
    // required this.onSubmit,
  });
  final Tag tag;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckBoxChartListBodyState();

  // final void Function(BuildContext context, Iterable<Chart> charts, String? uid)
  //     onSubmit;
}

class _CheckBoxChartListBodyState
    extends UserAuthDependedState<CheckboxChartListBody> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: findingUid
          ? const Center(child: LoadingWidget())
          : CheckboxChartListModal(
              colorScheme: LasotuviAppStyle.colorScheme,
              translate: translate,
              child: BasicStreamBuilder(
                stream:
                    ref.watch(chartHasTagsListControllerProvider).stream(uid),
                child: (chartHasTags) => BasicFutureBuilder(
                  future: SortHelper.getSortOption(chartSortKey),
                  child: (sortValue) {
                    final CheckboxDataListController<ChartHasTags> controller =
                        CheckboxDataListController<ChartHasTags>(
                      whereTest: (item, query) =>
                          chartWhereClause(item.source, query),
                      initSelected: (ChartHasTags item) =>
                          initSelected(item, widget.tag.id),
                      itemId: (ChartHasTags item) => item.source.id,
                      sortOption: sortValue,
                      itemComparator: selectableChartHasTagsComparator,
                      onSaveSortOption: (e) =>
                          (key, value) => SortHelper.saveSortOption(key, value),
                    );
                    return CheckBoxChartListWidget(
                      chartHasTags ?? [],
                      uid: uid,
                      tagId: widget.tag.id,
                      translate: translate,
                      colorScheme: LasotuviAppStyle.colorScheme,
                      controller: controller,
                      onCancel: onCancel,
                      onSubmit: onSubmit,
                      onItemTap: (context, chart, _) =>
                          ChartNavigation.openChartView(
                        context: context,
                        chart: chart,
                        saveLastView: false,
                      ),
                      onSaveSortOption: (key, value) =>
                          SortHelper.saveSortOption(key, value),
                      initSortValue: sortValue,
                    );
                  },
                ),
              ),
            ),
    );
  }

  bool initSelected(ChartHasTags item, int tagId) {
    final result = item.carry
        .where(
          (element) => element.id == tagId,
        )
        .isNotEmpty;
    return result;
  }

  Future<bool> onWillPop() async {
    await CheckboxDataListController.clearCache();
    return true;
  }

  void onCancel(BuildContext context) {
    Navigator.maybePop(context);
  }

  Future<void> onSubmit(BuildContext context,
      Iterable<SelectableItem<ChartHasTags>> chartHasTags, String? uid) async {
    ref.read(chartHasTagsListControllerProvider).stop();
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Future.delayed(Duration.zero);
      if (context.mounted) {
        Navigator.maybePop(context);
      }
    });
    final connectedCharts = chartHasTags
        .where(
          (element) => !element.initSelected && element.selected,
        )
        .map((e) => e.data.source);

    final disConnectedCharts = chartHasTags
        .where(
          (element) => element.initSelected && !element.selected,
        )
        .map((e) => e.data.source);
    if (connectedCharts.isNotEmpty) {
      await ref.read(connectChartsToTagProvider).call(
            uid: uid,
            right: widget.tag,
            lefts: connectedCharts,
            refresh: false,
          );
    }

    if (disConnectedCharts.isNotEmpty) {
      await ref.read(disConnectChartsFromTagProvider).call(
            uid: uid,
            right: widget.tag,
            lefts: disConnectedCharts,
            refresh: false,
          );
    }
  }
}
