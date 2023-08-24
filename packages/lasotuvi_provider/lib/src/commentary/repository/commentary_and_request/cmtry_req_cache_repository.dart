import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../request/repository/request_cache_repository.dart';
import 'cmtry_req_cloud_cache_repository.dart';
import 'cmtry_req_local_repository.dart';

final commentaryAndRequestCacheRepositoryProvider =
    Provider.autoDispose<CommentaryAndRequestRepository>(
  (ref) => CommentaryAndRequestRepositoryImpl(
      localDependentRepository:
          ref.read(localCommentaryAndRequestRepositoryProvider),
      cloudDependentRepository: ref.read(cmtryReqCloudCacheRepositoryProvider),
      ownerRepository: ref.read(requestCacheRepositoryProvider)),
);
