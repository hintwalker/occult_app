import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../request/repository/local_request_repository.dart';
import '../../data_source/sqlite_commentary_data_source.dart';

final localCommentaryAndRequestRepositoryProvider =
    Provider.autoDispose<LocalCommentaryAndRequestRepository>(
  (ref) => LocalCommentaryAndRequestRepositoryImpl(
      ref.read(sqliteCommentaryDataSourceProvider),
      ownerRepository: ref.read(localRequestRepositoryProvider)),
);
