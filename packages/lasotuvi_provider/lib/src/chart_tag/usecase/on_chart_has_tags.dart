import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_tag_cache_repository.dart';

final onChartHasTagsProvider = Provider.autoDispose<OnChartHasTags>((ref) =>
    OnChartHasTags(repository: ref.read(chartTagCacheRepositoryProvider)));
