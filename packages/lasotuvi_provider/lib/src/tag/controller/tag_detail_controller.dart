import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';

import '../../chart_tag/usecase/on_tag_has_charts.dart';

final tagDetailControllerProvider =
    ChangeNotifierProvider.autoDispose<TagDetailController>(
  (ref) => TagDetailController(onData: ref.read(onTagHasChartsProvider)),
);
