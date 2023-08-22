import 'package:flutter/material.dart';
import 'package:lstv_chart_view/src/state/chart_list_state.dart';
import 'package:tauari_animated_listview/tauari_animated_listview.dart';

class ChartListView extends StatelessWidget {
  const ChartListView({
    super.key,
    required this.state,
  });
  final ChartListState state;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedListView(
          data: state.data,
          itemBuilder: (item) => Text(item.source.name),
          listKey: state.listkey,
        ),
        if (state.workingState == ChartListWorkingState.initial ||
            state.workingState == ChartListWorkingState.loading)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}
