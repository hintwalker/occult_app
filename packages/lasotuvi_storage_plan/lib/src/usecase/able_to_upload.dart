import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_auth/tauari_auth.dart';

class AbleToUpload {
  const AbleToUpload({
    required this.verifyCurrentPlanState,
    required this.countChartOnCloud,
    required this.countNoteOnCloud,
    required this.countTagOnCloud,
    required this.takeCurrentUser,
  });
  final VerifyCurrentPlanState verifyCurrentPlanState;
  final CountChartOnCloud countChartOnCloud;
  final CountTagOnCloud countTagOnCloud;
  final CountNoteOnCloud countNoteOnCloud;
  final TakeCurrentUser takeCurrentUser;
  Future<bool> call<T>(int amount) async {
    final verifiedPlan = await verifyCurrentPlanState();
    final user = takeCurrentUser();
    int limitCloud = 5;
    int count = 0;
    if (T == Chart) {
      limitCloud = verifiedPlan.usingPlan.limitChart;
      count = await countChartOnCloud(user?.uidInFirestore);
    } else if (T == Note) {
      limitCloud = verifiedPlan.usingPlan.limitNote;
      count = await countNoteOnCloud(user?.uidInFirestore);
    } else if (T == Tag) {
      limitCloud = verifiedPlan.usingPlan.limitTag;
      count = await countTagOnCloud(user?.uidInFirestore);
    }
    return count + amount <= limitCloud;
  }
}
