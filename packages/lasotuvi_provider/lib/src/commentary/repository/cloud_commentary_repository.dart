import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/cloud_chart_repository_provider.dart';
import '../data_source/firebase_commentary_data_source.dart';

final cloudCommentaryRepositoryProvider =
    Provider.autoDispose<CloudCommentaryRepositoryImpl>(
  (ref) => CloudCommentaryRepositoryImpl(
      ref.read(firebaseCommentaryDataSourceProvider),
      ownerIdColumn: ColumnCommentary.requestId,
      ownerRepository: ref.read(cloudChartRepositoryProvider),
      entityToModel: (commentary) => CommentaryModel.fromEntity(commentary)),
);
