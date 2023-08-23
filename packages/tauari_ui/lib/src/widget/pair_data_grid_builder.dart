import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../controller/syncable_pair_data_list_stream_controller.dart';
import 'builder/basic_stream_builder.dart';
// import 'error_text_widget.dart';
// import 'loading_widget.dart';

class PairDataGridBuilder<E extends SyncableEntity, O extends SyncableEntity,
    P extends SyncableEntityPair<E, O>> extends StatelessWidget {
  const PairDataGridBuilder({
    super.key,
    this.uid,
    required this.controller,
    required this.itemWidget,
    required this.queryArgs,
    required this.emptyDataText,
  });

  final String? uid;
  final SyncablePairDataListStreamController<E, O, P> controller;
  final Widget Function(P) itemWidget;
  final QueryArgs queryArgs;
  final Widget emptyDataText;

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder(
        stream: controller.stream(uid, queryArgs),
        child: (data) {
          if (data == null || data.isEmpty) {
            return Center(child: emptyDataText);
          } else {
            return StaggeredGrid.count(
              // physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap: true,
              axisDirection: AxisDirection.down,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 4.0,
              crossAxisCount: 2,
              children: List.generate(
                  data.length, (index) => itemWidget(data.elementAt(index))),
            );
          }
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const LoadingWidget();
          // } else if (snapshot.hasData) {
          //   final data = snapshot.requireData;
          //   return StaggeredGrid.count(
          //     // physics: const NeverScrollableScrollPhysics(),
          //     // shrinkWrap: true,
          //     axisDirection: AxisDirection.down,
          //     mainAxisSpacing: 8.0,
          //     crossAxisSpacing: 4.0,
          //     crossAxisCount: 2,
          //     children: List.generate(
          //         data.length, (index) => itemWidget(data.elementAt(index))),
          //   );
          // } else {
          //   return const ErrorTextWidget();
          // }
        });
  }
}
