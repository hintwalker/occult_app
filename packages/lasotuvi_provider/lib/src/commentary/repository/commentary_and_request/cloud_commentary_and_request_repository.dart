import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../request/repository/cloud_request_repository.dart';
import '../../data_source/firebase_commentary_data_source.dart';

final cloudCommentaryAndRequestRepositoryProvider =
    Provider.autoDispose<CloudCommentaryAndRequestRepository>(
  (ref) => CloudCommentaryAndRequestRepositoryImpl(
      ref.read(firebaseCommentaryDataSourceProvider),
      ownerRepository: ref.read(cloudRequestRepositoryProvider)),
);
