import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../database/local_database_provider.dart';

final requestDaoProvider = Provider.autoDispose<RequestDao>(
  (ref) => RequestDao(ref.read(localDatabaseProvider)),
);
