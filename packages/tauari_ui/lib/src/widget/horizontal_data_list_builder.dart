import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../controller/syncable_data_list_stream_controller.dart';
import 'error_text_widget.dart';
import 'loading_widget.dart';

class HorizontalDataListBuilder<T extends SyncableEntity>
    extends StatelessWidget {
  const HorizontalDataListBuilder({
    super.key,
    required this.uid,
    required this.controller,
    required this.itemWidget,
    required this.queryArgs,
  });

  final String? uid;
  final SyncableDataListStreamController<T> controller;
  final Widget Function(T) itemWidget;
  final QueryArgs queryArgs;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: controller.stream(uid, queryArgs),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingWidget();
          } else if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return itemWidget(snapshot.requireData.elementAt(index));
              },
              itemCount: snapshot.requireData.length,
            );
          } else {
            return const ErrorTextWidget();
          }
        });
  }
}
