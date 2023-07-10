import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_model.dart';

class LocalChartRepositoryImpl extends LocalRepositoryImpl<Chart, ChartModel>
    implements LocalChartRepository {
  LocalChartRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => ChartModel.fromEntity(entity));
}
