part of lasotuvi_storage_plan;

class StoragePlanModel extends CloudModel<StoragePlan> {
  const StoragePlanModel({
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
  String get docId => id;

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

  @override
  Map<String, Object?> toCloud() {
    final map = dump();
    map.remove(columnId);
    return map;
  }

  @override
  StoragePlan toEntity() {
    return StoragePlan(
        id: id,
        limitChart: limitChart,
        limitNote: limitNote,
        limitTag: limitTag,
        energy: energy,
        title: title);
  }

  factory StoragePlanModel.fromMap(Map<String, Object?> map) {
    return StoragePlanModel(
      id: map[columnId] as String,
      limitChart: map[ColumnStoragePackage.limitChart] as int,
      limitNote: map[ColumnStoragePackage.limitNote] as int,
      limitTag: map[ColumnStoragePackage.limitTag] as int,
      energy: map[ColumnStoragePackage.energy] as int,
      title: map[ColumnStoragePackage.title] as String,
    );
  }

  factory StoragePlanModel.fromEntity(StoragePlan entity) {
    return StoragePlanModel(
        id: entity.id,
        limitChart: entity.limitChart,
        limitNote: entity.limitNote,
        limitTag: entity.limitTag,
        energy: entity.energy,
        title: entity.title);
  }
}
