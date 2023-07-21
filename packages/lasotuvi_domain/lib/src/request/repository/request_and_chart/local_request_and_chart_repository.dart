import 'package:tauari_data_core/tauari_data_core.dart';

import '../../../chart/entity/chart.dart';
import '../../entity/request.dart';

abstract class LocalRequestAndChartRepository
    extends LocalDependentRepository<Request, Chart> {}
