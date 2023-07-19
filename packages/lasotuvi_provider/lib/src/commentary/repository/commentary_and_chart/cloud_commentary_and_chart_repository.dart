import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/cloud_chart_repository_provider.dart';
import '../../data_source/firebase_commentary_data_source.dart';

final cloudCommentaryAndChartRepositoryProvider =
    Provider.autoDispose<CloudCommentaryAndChartRepository>(
  (ref) => CloudCommentaryAndChartRepositoryImpl(
      ref.read(firebaseCommentaryDataSourceProvider),
      ownerRepository: ref.read(cloudChartRepositoryProvider)),
);
