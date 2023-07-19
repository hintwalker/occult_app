import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_commentary/lasotuvi_commentary.dart';

import '../usecase/on_commentary_and_chart.dart';

final commentaryAndChartListControllerProvider =
    ChangeNotifierProvider.autoDispose<CommentaryAndChartListController>(
        (ref) => CommentaryAndChartListController(
            onData: ref.read(onCommentaryAndChartProvider)));
