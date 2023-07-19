import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/chart_repository_provider.dart';
import 'cloud_commentary_and_chart_repository.dart';
import 'local_commentary_and_chart_repository.dart';

final commentaryAndChartRepositoryProvider =
    Provider.autoDispose<CommentaryAndChartRepository>(
  (ref) => CommentaryAndChartRepositoryImpl(
      localDependentRepository:
          ref.read(localCommentaryAndChartRepositoryProvider),
      cloudDependentRepository:
          ref.read(cloudCommentaryAndChartRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
