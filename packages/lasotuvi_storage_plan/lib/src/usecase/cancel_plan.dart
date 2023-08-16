import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';

import '../entity/cancel_plan_action_result.dart';
import 'package:tauari_auth/tauari_auth.dart';

// import '../entity/storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

///
/// Hủy gói đăng ký
///
/// Việc hủy gói được thực hiện tự động bởi hệ thống khi quá hạn.
///
/// Hủy gói đăng ký đồng nghĩa với việc chuyển gói đăng ký hiện tại (currentSubscription)
/// sang gói miễn phí, đồng thời cập nhật dữ liệu gói vừa hủy (lastCanceled)
///
/// Các bước xử lý:
/// - Lấy gói đăng ký hiện tại
/// - Cập nhật gói đăng ký đã hủy bằng gói đăng ký hiện tại
/// - Cập nhật gói đăng ký hiện tại bằng gói miễn phí.

class CancelPlan {
  const CancelPlan({
    required this.updateCurrentSubscription,
    required this.updateLastCanceledSubscription,
    required this.takeCurrentSubscription,
    required this.takeCurrentUser,
    required this.deleteExcessData,
  });
  final UpdateCurrentSubscription updateCurrentSubscription;
  final UpdateLastCanceledSubscription updateLastCanceledSubscription;
  final TakeCurrentSubscription takeCurrentSubscription;
  final TakeCurrentUser takeCurrentUser;
  final DeleteExcessData deleteExcessData;

  Future<CancelPlanActionResult> call(Subscription? currentSub) async {
    final user = takeCurrentUser();
    if (user == null) {
      return CancelPlanActionResult.needSignIn;
    }
    // final currentSub = await takeCurrentSubscription(user.uidInFirestore);

    if (currentSub == null || currentSub.planId == StoragePlanIds.free) {
      return CancelPlanActionResult.success;
    }

    await updateLastCanceledSubscription(user.uidInFirestore, currentSub);

    final success = await updateCurrentSubscription.call(
      user.uidInFirestore,
      Subscription.free(),
    );

    await deleteExcessData();

    if (success) {
      return CancelPlanActionResult.success;
    }
    return CancelPlanActionResult.unknownError;
  }
}
