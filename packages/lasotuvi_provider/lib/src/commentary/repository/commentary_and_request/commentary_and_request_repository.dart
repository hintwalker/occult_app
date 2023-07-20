import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../request/repository/request_repository.dart';
import 'cloud_commentary_and_request_repository.dart';
import 'local_commentary_and_request_repository.dart';

final commentaryAndRequestRepositoryProvider =
    Provider.autoDispose<CommentaryAndRequestRepository>(
  (ref) => CommentaryAndRequestRepositoryImpl(
      localDependentRepository:
          ref.read(localCommentaryAndRequestRepositoryProvider),
      cloudDependentRepository:
          ref.read(cloudCommentaryAndRequestRepositoryProvider),
      ownerRepository: ref.read(requestRepositoryProvider)),
);
