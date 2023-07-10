import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_data_core/tauari_data_core.dart';

import '../model/chart_model.dart';

class ChartRepositoryImpl extends SyncableRepositoryImpl<Chart, ChartModel>
    implements ChartRepository {
  ChartRepositoryImpl({
    required super.localRepository,
    required super.cloudRepository,
  });
}
