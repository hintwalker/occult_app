part of lasotuvi_domain;

class Tag extends SyncableEntity<Tag> {
  Tag(
    super.id, {
    required this.title,
    required this.subTitle,
    required this.created,
    super.syncStatus,
    super.storageState,
  });
  final String title;
  final String subTitle;
  final DateTime created;

  factory Tag.fromMap(Map<String, Object?> map) {
    return Tag(
      map[columnId] as int,
      title: map[ColumnTag.title] == null ? '' : map[ColumnTag.title] as String,
      subTitle: map[ColumnTag.description] == null
          ? ''
          : map[ColumnTag.description] as String,
      created: map[columnCreated] == null
          ? DateTime.fromMillisecondsSinceEpoch(map[columnId] as int)
          : DateTime.fromMillisecondsSinceEpoch(map[columnCreated] as int),
      storageState:
          map[columnState] == null ? null : map[columnState] as String,
      syncStatus:
          map[columnOnCloud] == null ? null : map[columnOnCloud] as String,
    );
  }

  @override
  bool operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is Tag && other.id == id;

  @override
  int get hashCode => id.hashCode;

  // Map<String, Object?> toCloud() {
  //   final map = toMap();
  //   map.remove(columnId);
  //   map.remove(columnOnCloud);
  //   return map;
  // }

  @override
  Map<String, Object?> dump() {
    return {
      columnId: id,
      ColumnTag.title: title,
      ColumnTag.description: subTitle,
      columnCreated: created.millisecondsSinceEpoch,
      columnState: state,
      columnOnCloud: onCloud,
    };
  }

  @override
  Tag copyWithOnCloud(String? value) {
    return copyWith(syncStatus: value);
  }

  Tag copyWith({
    int? id,
    String? title,
    String? subTitle,
    DateTime? created,
    String? syncStatus,
    String? storageState,
  }) {
    return Tag(
      id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      created: created ?? this.created,
      syncStatus: syncStatus ?? this.syncStatus,
      storageState: storageState ?? this.storageState,
    );
  }

  @override
  Tag copyWithState(String? state) => copyWith(storageState: state);
}
