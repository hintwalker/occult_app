import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_tag_repository.dart';

final disConnectTagsFromChartProvider =
    Provider.autoDispose<DisConnectTagsFromChart>(
  (ref) => DisConnectTagsFromChart(ref.read(chartTagRepositoryProvider)),
);
