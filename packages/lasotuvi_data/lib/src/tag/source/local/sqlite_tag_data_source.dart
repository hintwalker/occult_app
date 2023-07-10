import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/tag_model.dart';

class SqliteTagDataSource extends LocalDataSource<TagModel> {
  SqliteTagDataSource(super.dao)
      : super(fromMap: (map) => TagModel.fromMap(map));
}
