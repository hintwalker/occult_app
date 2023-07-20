import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/request_model.dart';

class SqliteRequestDataSource extends LocalDataSource<RequestModel> {
  SqliteRequestDataSource(super.dao)
      : super(fromMap: (map) => RequestModel.fromMap(map));
}
