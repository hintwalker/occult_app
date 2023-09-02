import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

import '../model/chart_model.dart';

class ChartLocalRepositoryImpl extends LocalRepositoryImpl<Chart, ChartModel>
    implements ChartLocalRepository {
  ChartLocalRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => ChartModel.fromEntity(entity));
}
