import 'cloud_data_order_by.dart';
import 'cloud_data_where.dart';

class QueryArgs {
  const QueryArgs({
    this.uid,
    this.whereArgs,
    this.groupBy,
    this.having,
    this.orderBy,
    this.limitDisplay,
    this.limitLocal,
    this.limitCloud,
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
  final int? limitLocal;
  final int? limitCloud;
  final int? offset;
  final String? uid;
  final CloudDataOrderBy? firestoreOrderBy;
  final CloudDataWhere? firestoreWhere;

  QueryArgs copyWith({
    int? limitDisplay,
    bool? distinct,
    List<String>? columns,
    String? where,
    List<Object?>? whereArgs,
    String? groupBy,
    String? having,
    String? orderBy,
    int? limitLocal,
    int? limitCloud,
    int? offset,
    String? uid,
    CloudDataOrderBy? firestoreOrderBy,
    CloudDataWhere? firestoreWhere,
  }) =>
      QueryArgs(
        limitLocal: limitLocal ?? this.limitLocal,
        limitCloud: limitCloud ?? this.limitCloud,
        limitDisplay: limitDisplay ?? this.limitDisplay,
        distinct: distinct ?? this.distinct,
        columns: columns ?? this.columns,
        where: where ?? this.where,
        whereArgs: whereArgs ?? this.whereArgs,
        groupBy: groupBy ?? this.groupBy,
        having: having ?? this.having,
        orderBy: orderBy ?? this.orderBy,
        offset: offset ?? this.offset,
        uid: uid ?? this.uid,
        firestoreOrderBy: firestoreOrderBy ?? this.firestoreOrderBy,
        firestoreWhere: firestoreWhere ?? this.firestoreWhere,
      );

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
            other.limitLocal == limitLocal &&
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
        limitLocal,
        offset,
        uid,
        where,
        whereArgs,
      );
}
