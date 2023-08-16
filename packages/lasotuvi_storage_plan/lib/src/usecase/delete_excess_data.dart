import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_auth/tauari_auth.dart';

class DeleteExcessData {
  const DeleteExcessData({
    required this.deleteChartFromRange,
    required this.deleteNoteFromRange,
    required this.deleteTagFromRange,
    required this.takeCurrentUser,
    required this.takeCurrentStoragePlan,
  });
  final DeleteChartRangeOnCloud deleteChartFromRange;
  final DeleteNoteRangeOnCloud deleteNoteFromRange;
  final DeleteTagRangeOnCloud deleteTagFromRange;
  final TakeCurrentUser takeCurrentUser;
  final TakeCurrentStoragePlan takeCurrentStoragePlan;

  Future<void> call() async {
    final user = takeCurrentUser();
    if (user == null) {
      return;
    }
    final plan = await takeCurrentStoragePlan(user.uidInFirestore);
    await deleteNoteFromRange(user.uidInFirestore, plan.limitNote);
    await deleteTagFromRange(user.uidInFirestore, plan.limitTag);
    await deleteChartFromRange(user.uidInFirestore, plan.limitChart);
  }
}
