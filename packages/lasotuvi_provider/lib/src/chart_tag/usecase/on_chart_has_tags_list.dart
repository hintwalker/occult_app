import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/chart_tag_repository.dart';

final onChartHasTagsListProvider = Provider.autoDispose<OnChartHasTagsList>(
    (ref) =>
        OnChartHasTagsList(repository: ref.read(chartTagRepositoryProvider)));
