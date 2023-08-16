import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/chart.dart';

class OnCharts extends OnSyncableDataList<Chart> {
  const OnCharts(super.repository);
  // @override
  // Stream<Iterable<Chart>> call(String? uid, [QueryArgs? queryArgs]) {
  //   final limitQueryArgs = queryArgs?.copyWith(limitCloud: limitCloudChart) ??
  //       QueryArgs(limitCloud: limitCloudChart);
  //   return super.call(uid, limitQueryArgs);
  // }
}
