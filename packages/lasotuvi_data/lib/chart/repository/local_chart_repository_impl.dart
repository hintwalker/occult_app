part of lasotuvi_data;

class LocalChartRepositoryImpl extends LocalRepositoryImpl<Chart, ChartModel>
    implements LocalChartRepository {
  LocalChartRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => ChartModel.fromEntity(entity));
}
