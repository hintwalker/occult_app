import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

final ableToUploadProvider = Provider(
  (ref) => AbleToUpload(
    verifyCurrentPlanState: ref.read(verifyCurrentPlanStateProvider),
    countChartOnCloud: ref.read(countChartOnCloudProvider),
    countNoteOnCloud: ref.read(countNoteOnCloudProvider),
    countTagOnCloud: ref.read(countTagOnCloudProvider),
    takeCurrentUser: ref.read(takeCurrentUserProvider),
  ),
);
