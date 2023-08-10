import 'package:tauari_data_core/tauari_data_core.dart';

import 'column_storage_plan.dart';

class StoragePlan implements CloudGetable, Dumpable {
  const StoragePlan({
    required this.id,
    required this.limitChart,
    required this.limitNote,
    required this.limitTag,
    required this.energy,
    required this.title,
  });

  final String id;
  final int limitChart;
  final int limitTag;
  final int limitNote;
  final int energy;
  final String title;

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id.toString(),
      ColumnStoragePackage.limitChart: limitChart,
      ColumnStoragePackage.limitNote: limitNote,
      ColumnStoragePackage.limitTag: limitTag,
      ColumnStoragePackage.energy: energy,
      ColumnStoragePackage.title: title,
    };
  }

  factory StoragePlan.fromMap(Map<String, Object?> map) {
    return StoragePlan(
      id: map[columnId] as String,
      limitChart: map[ColumnStoragePackage.limitChart] as int,
      limitNote: map[ColumnStoragePackage.limitNote] as int,
      limitTag: map[ColumnStoragePackage.limitTag] as int,
      energy: map[ColumnStoragePackage.energy] as int,
      title: map[ColumnStoragePackage.title] as String,
    );
  }

  const StoragePlan.free(
      {this.id = '0',
      this.limitChart = 10,
      this.limitNote = 10,
      this.limitTag = 10,
      this.energy = 0,
      this.title = 'T0'});

  @override
  String get docId => id;
}
