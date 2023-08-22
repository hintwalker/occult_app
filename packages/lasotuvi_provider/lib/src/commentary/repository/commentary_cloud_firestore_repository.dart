// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// import '../../chart/repository/chart_cloud_firestore_repository.dart';
// import '../data_source/commentary_firestore_data_source.dart';

// final commentaryCloudFirestoreRepositoryProvider =
//     Provider.autoDispose<CommentaryCloudRepositoryImpl>(
//   (ref) => CommentaryCloudRepositoryImpl(
//       ref.read(commentaryFirestoreDataSourceProvider),
//       ownerIdColumn: ColumnCommentary.requestId,
//       ownerRepository: ref.read(chartCloudFirestoreRepositoryProvider),
//       entityToModel: (commentary) => CommentaryModel.fromEntity(commentary)),
// );
