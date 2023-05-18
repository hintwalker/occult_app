part of lasotuvi_storage_plan;

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

  @override
  String get docId => id;
}
