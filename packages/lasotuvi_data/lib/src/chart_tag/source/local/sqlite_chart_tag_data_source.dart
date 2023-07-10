import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/chart_tag_model.dart';

class SqliteChartTagDataSource extends LocalDataSource<ChartTagModel> {
  SqliteChartTagDataSource(super.dao)
      : super(fromMap: (map) => ChartTagModel.fromMap(map));
}
