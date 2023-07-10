import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../controller/syncable_data_list_stream_controller.dart';
import 'error_text_widget.dart';
import 'loading_widget.dart';

class DataGridBuilder<E extends SyncableEntity> extends StatelessWidget {
  const DataGridBuilder({
    super.key,
    this.uid,
    required this.controller,
    required this.itemWidget,
    required this.queryArgs,
  });

  final String? uid;
  final SyncableDataListStreamController<E> controller;
  final Widget Function(E) itemWidget;
  final QueryArgs queryArgs;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream(uid, queryArgs),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasData) {
            final data = snapshot.requireData;
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
          } else {
            return const ErrorTextWidget();
          }
        });
  }
}
