import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_tag_repository.dart';

final syncChartTagsProvider = Provider.autoDispose<SyncChartTags>(
  (ref) => SyncChartTags(ref.read(chartTagRepositoryProvider)),
);
