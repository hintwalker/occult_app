import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_model.dart';

class CloudChartRepositoryImpl extends CloudRepositoryImpl<Chart, ChartModel>
    implements CloudChartRepository {
  CloudChartRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => ChartModel.fromEntity(entity));
}
