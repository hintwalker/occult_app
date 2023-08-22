import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/chart_cache_repository.dart';
import 'note_and_chart_cloud_cache_repository.dart';
import 'note_and_chart_local_repository.dart';

final noteAndChartCacheRepositoryProvider =
    Provider.autoDispose<NoteAndChartRepository>(
  (ref) => NoteAndChartRepositoryImpl(
      localDependentRepository: ref.read(localNoteAndChartRepositoryProvider),
      cloudDependentRepository:
          ref.read(noteAndChartCloudCacheRepositoryProvider),
      ownerRepository: ref.read(chartCacheRepositoryProvider)),
);
