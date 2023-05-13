part of lasotuvi_data;

class LocalChartTagRepositoryImpl
    extends LocalRelRepositoryImpl<ChartTag, ChartTagModel, Chart, Tag> {
  LocalChartTagRepositoryImpl(
    super.dataSource, {
    required super.leftIdColumn,
    required super.rightIdColumn,
    required super.leftRepository,
    required super.rightRepository,
  }) : super(
            entityToModel: (e) => ChartTagModel.fromEntity(e),
            entityFromIds: (id, chartId, tagId) =>
                ChartTag.fromIds(id, chartId, tagId));

  @override
  int getLeftId(ChartTag entity) => entity.chartId;

  @override
  int getRightId(ChartTag entity) => entity.tagId;
}
