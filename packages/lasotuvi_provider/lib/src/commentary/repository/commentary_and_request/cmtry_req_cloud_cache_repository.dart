import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/src/commentary/data_source/commentary_firestore_data_source.dart';

import '../../../request/repository/request_cloud_cache_repository.dart';
import '../../data_source/commentary_cache_data_source.dart';

final cmtryReqCloudCacheRepositoryProvider =
    Provider.autoDispose<CloudCommentaryAndRequestRepository>(
  (ref) => CloudCommentaryAndRequestRepositoryImpl(
      ref.read(commentaryCacheDataSourceProvider),
      onlineDataSource: ref.read(commentaryFirestoreDataSourceProvider),
      ownerRepository: ref.read(requestCloudCacheRepositoryProvider)),
);
