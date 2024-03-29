import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/tag_sqlite_data_source.dart';

final tagLocalRepositoryProvider = Provider.autoDispose<LocalTagRepository>(
    (ref) => LocalTagRepositoryImpl(ref.read(tagSqliteDataSourceProvider)));
