import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_repository_provider.dart';
import 'cloud_commentary_repository.dart';
import 'local_commentary_repository.dart';

final commentaryRepositoryProvider = Provider.autoDispose<CommentaryRepository>(
  (ref) => CommentaryRepositoryImpl(
      localDependentRepository: ref.read(localCommentaryRepositoryProvider),
      cloudDependentRepository: ref.read(cloudCommentaryRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
