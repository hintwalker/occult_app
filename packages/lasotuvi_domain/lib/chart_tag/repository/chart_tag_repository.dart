part of lasotuvi_domain;

abstract class ChartTagRepository extends SyncableRepository<ChartTag> {
  ChartTagRepository(
      {required super.localRepository, required super.cloudRepository});
}
