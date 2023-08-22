// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// import '../../chart/repository/chart_cloud_firestore_repository.dart';
// import '../data_source/note_firestore_data_source.dart';

// final noteCloudFirestoreRepositoryProvider =
//     Provider.autoDispose<CloudNoteRepositoryImpl>(
//   (ref) => CloudNoteRepositoryImpl(
//     ref.read(noteFirestoreDataSourceProvider),
//     onlineDataSource: ref.read(note),
//     ownerIdColumn: ColumnNote.chartId,
//     ownerRepository: ref.read(chartCloudFirestoreRepositoryProvider),
//     entityToModel: (note) => NoteModel.fromEntity(note),
//   ),
// );
