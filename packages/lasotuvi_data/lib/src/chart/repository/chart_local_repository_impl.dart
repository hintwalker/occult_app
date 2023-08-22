import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_model.dart';

class ChartLocalRepositoryImpl extends LocalRepositoryImpl<Chart, ChartModel>
    implements ChartLocalRepository {
  ChartLocalRepositoryImpl(super.dataSource)
      : super(entityToModel: (entity) => ChartModel.fromEntity(entity));
}
