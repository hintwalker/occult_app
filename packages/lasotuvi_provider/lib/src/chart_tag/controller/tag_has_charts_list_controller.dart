import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';

import '../usecase/on_tag_has_chart_list.dart';

final tagHasChartsListControllerProvider = ChangeNotifierProvider.autoDispose(
    (ref) => TagHasChartsListController(
        onData: ref.read(onTagHasChartsListProvider)));
