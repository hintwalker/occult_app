import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_tag_model.dart';

class CloudChartTagRepositoryImpl
    extends CloudRelRepositoryImpl<ChartTag, ChartTagModel, Chart, Tag> {
  CloudChartTagRepositoryImpl(
    super.cacheDataSource, {
    required super.onlineDataSource,
    required super.leftIdColumn,
    required super.rightIdColumn,
    required super.leftRepository,
    required super.rightRepository,
  }) : super(
          entityToModel: (e) => ChartTagModel.fromEntity(e),
          entityFromIds: (id, chartId, tagId) =>
              ChartTag.fromIds(id, chartId, tagId),
        );

  @override
  int getLeftId(ChartTag entity) => entity.chartId;

  @override
  int getRightId(ChartTag entity) => entity.tagId;
}
