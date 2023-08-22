// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// import '../../chart/repository/chart_firestore_repository.dart';
// import 'local_request_repository.dart';
// import 'request_cloud_firetore_repository.dart';

// final requestFirestoreRepositoryProvider =
//     Provider.autoDispose<RequestRepository>(
//   (ref) => RequestRepositoryImpl(
//       localDependentRepository: ref.read(localRequestRepositoryProvider),
//       cloudDependentRepository:
//           ref.read(requestCloudFirestoreRepositoryProvider),
//       ownerRepository: ref.read(chartFirestoreRepositoryProvider)),
// );
