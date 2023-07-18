import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import '../../library/navigation/library_navigation.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';
import '../../auth/auth_depended_state.dart';

class ChartDetailModalScreen extends ConsumerStatefulWidget {
  const ChartDetailModalScreen({
    super.key,
    required this.chartId,
    required this.syncStatus,
  });
  final String chartId;
  final String? syncStatus;

  @override
  ConsumerState<ChartDetailModalScreen> createState() =>
      _ChartDetailModalScreenState();
}

class _ChartDetailModalScreenState
    extends AuthDependedState<ChartDetailModalScreen> {
  @override
  Widget build(BuildContext context) {
    return findingUid
        ? const BasicLoadingModal(
            colorScheme: LasotuviAppStyle.colorScheme,
          )
        : BasicStreamBuilder(
            stream: ref.watch(chartDetailControllerProvider).stream(
                  uid: uid,
                  docId: int.parse(widget.chartId),
                  syncStatus: widget.syncStatus,
                ),
            child: (data) => ChartDetailModal(
              data,
              colorScheme: LasotuviAppStyle.colorScheme,
              onOpenBooksModal: () =>
                  LibraryNavigation.showBooksScreen(context),
              onOpenStarsModal: () =>
                  LibraryNavigation.showStarsScreen(context),
              child: ChartDetailWidget(
                data,
                translate: translate,
                colorScheme: LasotuviAppStyle.colorScheme,
              ),
            ),
          );
  }
}
