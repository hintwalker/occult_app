import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_provider/src/chart/usecase/delete_chart_range_on_cloud.dart';
import 'package:lasotuvi_provider/src/note/usecase/delete_note_range_on_cloud.dart';
import 'package:lasotuvi_provider/src/tag/usecase/delete_tag_range_on_cloud.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final deleteExcessDataProvider = Provider(
  (ref) => DeleteExcessData(
    deleteChartFromRange: ref.read(deleteChartRangeOnCloud),
    deleteNoteFromRange: ref.read(deleteNoteRangeOnCloud),
    deleteTagFromRange: ref.read(deleteTagRangeOnCloud),
    takeCurrentUser: ref.read(takeCurrentUserProvider),
    takeCurrentStoragePlan: ref.read(takeCurrentStoragePlanProvider),
  ),
);
