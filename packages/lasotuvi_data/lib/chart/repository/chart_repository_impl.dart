part of lasotuvi_data;

class ChartRepositoryImpl extends SyncableRepositoryImpl<Chart, ChartModel>
    implements ChartRepository {
  ChartRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });
}
