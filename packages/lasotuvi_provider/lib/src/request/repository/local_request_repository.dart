import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/sqlite_request_data_source.dart';

final localRequestRepositoryProvider =
    Provider.autoDispose<LocalRequestRepository>(
  (ref) =>
      LocalRequestRepositoryImpl(ref.read(sqliteRequestDataSourceProvider)),
);
