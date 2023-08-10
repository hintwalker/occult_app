import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_statistic/lasotuvi_statistic.dart';

import '../chart/usecase/count_chart.dart';
import '../chart/usecase/count_chart_on_cloud.dart';
import '../note/usecase/count_note.dart';
import '../note/usecase/count_note_on_cloud.dart';
import '../storage_plan/usecase/take_current_storage_plan.dart';
import '../tag/usecase/count_tag.dart';
import '../tag/usecase/count_tag_on_cloud.dart';

final statisticStateNotifierProvider =
    StateNotifierProvider<StatisticStateNotifier, StatisticState>(
  (ref) => StatisticStateNotifier(
      countChart: ref.read(
        countChartProvider,
      ),
      countChartOnCloud: ref.read(
        countChartOnCloudProvider,
      ),
      countTag: ref.read(
        countTagProvider,
      ),
      countTagOnCloud: ref.read(
        countTagOnCloudProvider,
      ),
      countNote: ref.read(
        countNoteProvider,
      ),
      countNoteOnCloud: ref.read(
        countNoteOnCloudProvider,
      ),
      takeCurrentStoragePlan: ref.read(
        takeCurrentStoragePlanProvider,
      )),
);
