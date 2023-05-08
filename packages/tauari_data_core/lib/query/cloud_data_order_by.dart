part of tauari_data_core;

class CloudDataOrderBy {
  const CloudDataOrderBy({required this.field, this.descending = false});
  final String field;
  final bool descending;
}
