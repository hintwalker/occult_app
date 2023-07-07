part of lasotuvi_domain;

class TagHasCharts extends SyncableEntityCarrier<Tag, Chart> {
  TagHasCharts({required super.source, required super.carry});

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other.runtimeType == runtimeType ||
      other is TagHasCharts && other.source == source;

  @override
  int get hashCode => source.hashCode;
}
