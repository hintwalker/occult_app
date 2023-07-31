import 'package:lasotuvi_storage_plan/src/entity/stop_auto_extend_action_result.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

///
/// Hủy gia hạn cho gói hiện tại.
///
/// Việc hủy gia hạn do người dùng thực hiện bằng cách nhấn nút hủy gia hạn
/// trong danh sách gói đang ký.
///
/// Hủy gia hạn đồng nghĩa với cập nhật lại trạng thái của gói đăng ký hiện tại
/// (currentSubscription) là cancelExtend
///
class StopAutoExtends {
  final CurrentSubscriptionRepository currentSubscriptionRepository;
  final TakeCurrentUser takeCurrentUser;

  const StopAutoExtends({
    required this.currentSubscriptionRepository,
    required this.takeCurrentUser,
  });

  Future<StopAutoExtendActionResult> call(Subscription subscription) async {
    final user = takeCurrentUser();
    if (user == null) {
      return StopAutoExtendActionResult.needSignIn;
    }
    // await subscriptionRepository.insert(uid, subscription);
    final success = await currentSubscriptionRepository.update(
      user.uidInFirestore,
      subscription.copyWith(
        status: SubscriptionStatus.cancelExtend,
      ),
    );
    if (success) {
      return StopAutoExtendActionResult.success;
    }
    return StopAutoExtendActionResult.unknownError;
  }
}
