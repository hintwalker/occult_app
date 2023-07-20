import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/local_chart_repository_provider.dart';
import '../data_source/sqlite_commentary_data_source.dart';

final localCommentaryRepositoryProvider =
    Provider.autoDispose<LocalCommentaryRepositoryImpl>(
  (ref) => LocalCommentaryRepositoryImpl(
      ref.read(sqliteCommentaryDataSourceProvider),
      ownerIdColumn: ColumnCommentary.requestId,
      ownerRepository: ref.read(localChartRepositoryProvider),
      entityToModel: (commentary) => CommentaryModel.fromEntity(commentary)),
);
