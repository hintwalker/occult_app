import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/commentary_dao.dart';

final sqliteCommentaryDataSourceProvider =
    Provider.autoDispose<SqliteCommentaryDataSource>(
  (ref) => SqliteCommentaryDataSource(ref.read(commentaryDaoProvider)),
);
