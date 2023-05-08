part of tauari_data_core;

class CloudDataWhere {
  const CloudDataWhere(
      {this.isEqualTo,
      this.isNotEqualTo,
      this.isLessThan,
      this.isLessThanOrEqualTo,
      this.isGreaterThan,
      this.isGreaterThanOrEqualTo,
      this.arrayContains,
      this.arrayContainsAny,
      this.whereIn,
      this.whereNotIn,
      this.isNull,
      required this.field});
  final Object field;
  final Object? isEqualTo;
  final Object? isNotEqualTo;
  final Object? isLessThan;
  final Object? isLessThanOrEqualTo;
  final Object? isGreaterThan;
  final Object? isGreaterThanOrEqualTo;
  final Object? arrayContains;
  final Iterable<Object?>? arrayContainsAny;
  final Iterable<Object?>? whereIn;
  final Iterable<Object?>? whereNotIn;
  final bool? isNull;
}
