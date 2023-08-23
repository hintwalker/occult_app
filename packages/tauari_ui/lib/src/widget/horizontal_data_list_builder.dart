import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../controller/syncable_data_list_stream_controller.dart';
import 'builder/basic_stream_builder.dart';
// import 'error_text_widget.dart';
// import 'loading_widget.dart';

class HorizontalDataListBuilder<T extends SyncableEntity>
    extends StatelessWidget {
  const HorizontalDataListBuilder({
    super.key,
    required this.uid,
    required this.controller,
    required this.itemWidget,
    required this.queryArgs,
    required this.emptyDataText,
  });

  final String? uid;
  final SyncableDataListStreamController<T> controller;
  final Widget Function(T) itemWidget;
  final QueryArgs queryArgs;
  final Widget emptyDataText;

  @override
  Widget build(BuildContext context) {
    return BasicStreamBuilder(
        stream: controller.stream(uid, queryArgs),
        child: (data) {
          if (data == null || data.isEmpty) {
            return Center(
              child: emptyDataText,
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return itemWidget(data.elementAt(index));
              },
              itemCount: data.length,
            );
          }
        }
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const LoadingWidget();
        // } else if (snapshot.hasData) {
        //   return ListView.builder(
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (ctx, index) {
        //       return itemWidget(snapshot.requireData.elementAt(index));
        //     },
        //     itemCount: snapshot.requireData.length,
        //   );
        // } else {
        //   return const ErrorTextWidget();
        // }
        );
  }
}
