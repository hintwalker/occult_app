// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_data/lasotuvi_data.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';

// import '../../chart/repository/chart_cloud_firestore_repository.dart';
// import '../data_source/request_firestore_data_source.dart';

// final requestCloudFirestoreRepositoryProvider =
//     Provider.autoDispose<RequestCloudRepositoryImpl>(
//   (ref) => RequestCloudRepositoryImpl(
//       ref.read(requestFirestoreDataSourceProvider),
//       ownerIdColumn: ColumnRequest.chartId,
//       ownerRepository: ref.read(chartCloudFirestoreRepositoryProvider),
//       entityToModel: (request) => RequestModel.fromEntity(request)),
// );
