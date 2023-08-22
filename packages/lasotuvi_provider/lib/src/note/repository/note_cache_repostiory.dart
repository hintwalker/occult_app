import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_cache_repository.dart';
import 'note_cloud_cache_repository.dart';
import 'note_local_repository.dart';

final noteCacheRepositoryProvider = Provider.autoDispose<NoteRepository>(
  (ref) => NoteRepositoryImpl(
      localDependentRepository: ref.read(noteLocalRepositoryProvider),
      cloudDependentRepository: ref.read(noteCloudCacheRepositoryProvider),
      ownerRepository: ref.read(chartCacheRepositoryProvider)),
);
