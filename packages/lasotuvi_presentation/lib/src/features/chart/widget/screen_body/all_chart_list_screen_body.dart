import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_sort/tauari_sort.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_style/tuvi_style.dart';

import '../../../../shared/widget/new_data_option_button.dart';
import '../../../navigation/drawer_ids.dart';
import '../../navigation/chart_navigation.dart';
import '../../../../helper/storage_helper.dart';
import '../../../../router/route_name.dart';
import '../../../../router/router_params.dart';
import '../../../auth/user_auth_depended_state.dart';

class AllChartListScreenBody extends ConsumerStatefulWidget {
  const AllChartListScreenBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllChartBodyState();
}

class _AllChartBodyState extends UserAuthDependedState<AllChartListScreenBody> {
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return WillPopScope(
      onWillPop: () {
        ref.read(mainDrawerControllerProvider).setScreenId(DrawerIds.home);
        return Future.value(false);
      },
      child: Stack(
        children: [
          findingUid
              ? const LoadingWidget()
              : BasicStreamBuilder(
                  stream:
                      ref.watch(chartHasTagsListControllerProvider).stream(uid),
                  child: (data) => BasicFutureBuilder<SortValue?>(
                    future: SortHelper.getSortOption(chartSortKey),
                    child: (sortValue) => AllChartListWidget(
                      data ?? [],
                      uid: uid,
                      slidable: false,
                      translate: translate,
                      colorScheme: lightColorScheme,
                      onOpenTag: onOpenTag,
                      onOpenNote: onOpenNote,
                      onOpenMore: onOpenMore,
                      onItemTap: onItemTap,
                      onOpenSyncStatus: ({required chart, required uid}) =>
                          StorageHelper.showOptionsModal<Chart>(
                        chart,
                        context: context,
                        uid: uid,
                        ref: ref,
                      ),
                      onSaveSortOption: SortHelper.saveSortOption,
                      initSortValue: sortValue,
                      // storageOptionsModalBuilder: (item, {syncStatus, uid}) =>
                      //     StorageHelper.storageOptionsModalBuilder<Chart>(item,
                      //         syncStatus: syncStatus, uid: uid, ref: ref),
                    ),
                  ),
                ),
          const NewDataOptionButton(),
        ],
      ),
    );
  }

  void onOpenTag(BuildContext context, Chart chart, String? uid) {
    context.pushNamed(RouteName.checkboxTagList, pathParameters: {
      RouterParams.chartId: chart.id.toString(),
      RouterParams.uid: uid ?? RouterParams.nullValue
    });
  }

  void onOpenNote(BuildContext context, Chart chart, String? uid) {}
  void onOpenMore(BuildContext context, Chart chart, String? uid) {}
  void onItemTap(BuildContext context, Chart chart, String? uid) {
    ChartNavigation.openChartView(
      context: context,
      chart: chart,
      saveLastView: true,
    );
  }
}
