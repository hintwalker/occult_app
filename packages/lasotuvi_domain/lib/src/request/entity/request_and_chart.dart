import 'package:tauari_data_core/tauari_data_core.dart';

import '../../chart/entity/chart.dart';
import 'request.dart';

class RequestAndChart extends SyncableEntityPair<Request, Chart> {
  RequestAndChart(super.entity1, super.entity2);
}
