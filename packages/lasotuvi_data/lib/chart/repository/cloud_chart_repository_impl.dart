part of lasotuvi_data;

class CloudChartRepositoryImpl extends CloudRepositoryImpl<Chart, ChartModel>
    implements CloudChartRepository {
  CloudChartRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => ChartModel.fromEntity(entity));
}
