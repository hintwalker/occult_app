import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart_tag.dart';

abstract class ChartTagRepository extends SyncableRepository<ChartTag> {
  ChartTagRepository(
      {required super.localRepository, required super.cloudRepository});
}
