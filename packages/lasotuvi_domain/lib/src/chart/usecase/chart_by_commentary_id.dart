import 'package:tauari_data_core/tauari_data_core.dart';

import '../../commentary/entity/commentary.dart';
import '../entity/chart.dart';

class ChartByCommentaryId extends OwnerByDependentId<Commentary, Chart> {
  ChartByCommentaryId(super.repository);
}
