import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../dao/tag_dao_provider.dart';

final tagSqliteDataSourceProvider = Provider.autoDispose<SqliteTagDataSource>(
    (ref) => SqliteTagDataSource(ref.read(tagDaoProvider)));
