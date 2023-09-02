import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/chart_model.dart';

class ChartSqliteDataSource extends LocalDataSource<ChartModel> {
  ChartSqliteDataSource(super.dao)
      : super(
          fromMap: (map) => ChartModel.fromMap(map),
        );
}
