import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_cloud_cache_repository.dart';
import '../data_source/note_cache_data_source.dart';
import '../data_source/note_firestore_data_source.dart';

final noteCloudCacheRepositoryProvider =
    Provider.autoDispose<CloudNoteRepositoryImpl>(
  (ref) => CloudNoteRepositoryImpl(
    ref.read(noteCacheDataSourceProvider),
    onlineDataSource: ref.read(noteFirestoreDataSourceProvider),
    ownerIdColumn: ColumnNote.chartId,
    ownerRepository: ref.read(chartCloudCacheRepositoryProvider),
    entityToModel: (note) => NoteModel.fromEntity(note),
  ),
);
