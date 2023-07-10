import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

class SyncableDataManipulateController<E extends SyncableEntity,
    R extends SyncableRelRepository> extends ChangeNotifier {
  SyncableDataManipulateController({
    required this.newData,
  });
  final NewData<E, R> newData;
}
