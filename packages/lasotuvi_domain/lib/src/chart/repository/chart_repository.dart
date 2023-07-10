import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';

abstract class ChartRepository extends SyncableRepository<Chart> {
  ChartRepository(
      {required super.localRepository, required super.cloudRepository});
}
