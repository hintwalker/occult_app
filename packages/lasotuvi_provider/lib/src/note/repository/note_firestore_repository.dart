// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// import '../../chart/repository/chart_firestore_repository.dart';
// import 'note_cloud_firestore_repository.dart';
// import 'note_local_repository.dart';

// final noteFirestoreRepositoryProvider = Provider.autoDispose<NoteRepository>(
//   (ref) => NoteRepositoryImpl(
//       localDependentRepository: ref.read(noteLocalRepositoryProvider),
//       cloudDependentRepository: ref.read(noteCloudFirestoreRepositoryProvider),
//       ownerRepository: ref.read(chartFirestoreRepositoryProvider)),
// );
