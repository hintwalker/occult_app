import 'package:tauari_data_core/tauari_data_core.dart';

import '../../../chart/entity/chart.dart';
import '../../entity/request.dart';

abstract class RequestAndChartRepository
    extends SyncableDependentRepository<Request, Chart> {
  RequestAndChartRepository(
      {required super.localRepository, required super.cloudRepository});
}
