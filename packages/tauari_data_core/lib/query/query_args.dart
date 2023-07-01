part of tauari_data_core;

class QueryArgs {
  const QueryArgs({
    this.uid,
    this.whereArgs,
    this.groupBy,
    this.having,
    this.orderBy,
    this.limitDisplay,
    this.limit,
    this.offset,
    this.distinct,
    this.columns,
    this.where,
    this.firestoreOrderBy,
    this.firestoreWhere,
  });
  final int? limitDisplay;
  final bool? distinct;
  final List<String>? columns;
  final String? where;
  final List<Object?>? whereArgs;
  final String? groupBy;
  final String? having;
  final String? orderBy;
  final int? limit;
  final int? offset;
  final String? uid;
  final CloudDataOrderBy? firestoreOrderBy;
  final CloudDataWhere? firestoreWhere;

  @override
  bool operator ==(Object? other) {
    identical(this, other) ||
        other is QueryArgs &&
            runtimeType == other.runtimeType &&
            other.columns == columns &&
            other.distinct == distinct &&
            other.firestoreOrderBy == firestoreOrderBy &&
            other.firestoreWhere == firestoreWhere &&
            other.groupBy == groupBy &&
            other.having == having &&
            other.limitDisplay == limitDisplay &&
            other.limit == limit &&
            other.offset == offset &&
            other.orderBy == orderBy &&
            other.uid == uid &&
            other.where == where &&
            other.whereArgs == whereArgs;

    return false;
  }

  @override
  int get hashCode => Object.hash(
        columns,
        distinct,
        firestoreOrderBy,
        firestoreWhere,
        groupBy,
        having,
        limitDisplay,
        limit,
        offset,
        uid,
        where,
        whereArgs,
      );
}
