import 'package:tauari_data_core/tauari_data_core.dart';

import '../../model/commentary_model.dart';

class SqliteCommentaryDataSource extends LocalDataSource<CommentaryModel> {
  SqliteCommentaryDataSource(super.dao)
      : super(fromMap: (map) => CommentaryModel.fromMap(map));
}
