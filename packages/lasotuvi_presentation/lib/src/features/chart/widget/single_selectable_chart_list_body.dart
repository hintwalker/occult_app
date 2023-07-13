import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../../helper/sort_helper.dart';
import '../../auth/auth_depended_state.dart';

class SingleSelectableChartListBody extends ConsumerStatefulWidget {
  const SingleSelectableChartListBody({
    super.key,
    required this.onSelect,
  });

  final void Function(BuildContext context, Chart chart, String? uid) onSelect;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SingleSelectableChartListBodyState();
}

class _SingleSelectableChartListBodyState
    extends AuthDependedState<SingleSelectableChartListBody> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const Center(child: LoadingWidget())
        : SingleSelectableChartListModal(
            translate: translate,
            colorScheme: LasotuviAppStyle.colorScheme,
            child: BasicStreamBuilder(
              stream: ref.watch(chartListControllerProvider).stream(uid),
              child: (data) => SingleSelectableChartListWidget(
                data,
                uid: uid,
                translate: translate,
                colorScheme: LasotuviAppStyle.colorScheme,
                onItemTap: widget.onSelect,
                onSaveSortOption: (key, value) =>
                    SortHelper.saveSortOption(key, value),
              ),
            ),
          );
  }

  // void onItemTap(BuildContext context, Chart chart, String? uid) {
  //   context.pushNamed(RouteName.chartView, pathParameters: {
  //     RouterParams.chartId: chart.id.toString(),
  //     RouterParams.uid: uid ?? RouterParams.uidNullValue
  //   });
  // }
}
