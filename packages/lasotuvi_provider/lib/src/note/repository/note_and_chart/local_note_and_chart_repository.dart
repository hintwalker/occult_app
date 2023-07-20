import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/local_chart_repository.dart';
import '../../data_source/sqlite_note_data_source.dart';

final localNoteAndChartRepositoryProvider =
    Provider.autoDispose<LocalNoteAndChartRepository>(
  (ref) => LocalNoteAndChartRepositoryImpl(
      ref.read(sqliteNoteDataSourceProvider),
      ownerRepository: ref.read(localChartRepositoryProvider)),
);
