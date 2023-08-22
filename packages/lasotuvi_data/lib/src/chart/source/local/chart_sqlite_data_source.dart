import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/chart_model.dart';

class ChartSqliteDataSource extends LocalDataSource<ChartModel> {
  ChartSqliteDataSource(super.dao)
      : super(fromMap: (map) => ChartModel.fromMap(map));

  // Stream<List<ChartModel>> onCharts({QueryArgs? queryArgs});
  // Stream<int?> onCountAll();
  // Future<int> countAll();

  // Future addChart(ChartModel item);

  // Future deleteFromLocal(int itemId);

  // Future<ChartModel?> chartById(int chartId);
}
