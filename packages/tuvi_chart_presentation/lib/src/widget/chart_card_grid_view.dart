import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import 'package:tuvi_chart_presentation/src/state/chart_list_state.dart';
import 'package:tuvi_chart_presentation/src/widget/chart_card_view.dart';

import '../style/chart_card_style.dart';

class ChartCardGridView extends UniversalWidget {
  const ChartCardGridView({
    super.key,
    required super.translate,
    required this.state,
    required this.onSyncStatusTap,
    required this.onTap,
    required this.itemStyle,
  });
  final ChartListState state;
  final void Function() onSyncStatusTap;
  final void Function(BuildContext context, Chart chart) onTap;
  final ChartCardStyle itemStyle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimationLimiter(
          key: ValueKey('${state.data.length}'),
          child: GridView.count(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            shrinkWrap: true,
            crossAxisCount: 2,
            children: List.generate(
              state.data.length,
              (index) => AnimationConfiguration.staggeredGrid(
                duration: const Duration(milliseconds: 375),
                position: index,
                columnCount: 2,
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Center(
                      child: ChartCardView(
                          translate: translate,
                          item: state.data.elementAt(index),
                          uid: state.uid,
                          onSyncStatusTap: onSyncStatusTap,
                          onTap: onTap,
                          style: itemStyle),
                    ),
                  ),
                ),
              ),
              // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2),
            ),
          ),
        ),
        if (state.workingState == ChartListWorkingState.loading ||
            state.workingState == ChartListWorkingState.initial)
          Positioned.fill(
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.blueGrey.withOpacity(0.3)),
              child: const LoadingWidget(),
            ),
          ),
      ],
    );
  }
}
