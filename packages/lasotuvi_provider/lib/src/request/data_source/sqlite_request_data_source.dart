import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/request_dao.dart';

final sqliteRequestDataSourceProvider =
    Provider.autoDispose<SqliteRequestDataSource>(
  (ref) => SqliteRequestDataSource(ref.read(requestDaoProvider)),
);
