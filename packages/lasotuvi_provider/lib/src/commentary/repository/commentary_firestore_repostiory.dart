// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// import '../../chart/repository/chart_firestore_repository.dart';
// import 'commentary_cloud_firestore_repository.dart';
// import 'local_commentary_repository.dart';

// final commentaryFirestoreRepositoryProvider =
//     Provider.autoDispose<CommentaryRepository>(
//   (ref) => CommentaryRepositoryImpl(
//     localDependentRepository: ref.read(localCommentaryRepositoryProvider),
//     cloudDependentRepository:
//         ref.read(commentaryCloudFirestoreRepositoryProvider),
//     ownerRepository: ref.read(chartFirestoreRepositoryProvider),
//   ),
// );
