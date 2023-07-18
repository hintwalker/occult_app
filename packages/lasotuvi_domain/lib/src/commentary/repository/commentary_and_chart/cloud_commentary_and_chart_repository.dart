import 'package:tauari_data_core/tauari_data_core.dart';

import '../../../chart/entity/chart.dart';
import '../../entity/commentary.dart';

abstract class CloudCommentaryAndChartRepository
    extends CloudDependentRepository<Commentary, Chart> {}
