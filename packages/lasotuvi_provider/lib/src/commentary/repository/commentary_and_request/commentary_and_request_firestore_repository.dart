// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// import '../../../request/repository/request_firetore_repository.dart';
// import 'cmtry_req_cloud_firestore_repository.dart';
// import 'commentary_and_request_local_repository.dart';

// final commentaryAndRequestFirestoreRepositoryProvider =
//     Provider.autoDispose<CommentaryAndRequestRepository>(
//   (ref) => CommentaryAndRequestRepositoryImpl(
//       localDependentRepository:
//           ref.read(localCommentaryAndRequestRepositoryProvider),
//       cloudDependentRepository:
//           ref.read(cmtryReqCloudFirestoreRepositoryProvider),
//       ownerRepository: ref.read(requestFirestoreRepositoryProvider)),
// );
