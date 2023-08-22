import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_local_repository.dart';
import '../data_source/commentary_sqlite_data_source.dart';

final localCommentaryRepositoryProvider =
    Provider.autoDispose<CommentaryLocalRepositoryImpl>(
  (ref) => CommentaryLocalRepositoryImpl(
      ref.read(sqliteCommentaryDataSourceProvider),
      ownerIdColumn: ColumnCommentary.requestId,
      ownerRepository: ref.read(chartLocalRepositoryProvider),
      entityToModel: (commentary) => CommentaryModel.fromEntity(commentary)),
);
