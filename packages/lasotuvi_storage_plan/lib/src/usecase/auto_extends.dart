import 'package:lasotuvi_storage_plan/src/entity/stop_auto_extend_action_result.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

///
/// Hủy gia hạn hoặc đăng ký gia hạn cho gói hiện tại.
///
/// Việc hủy gia hạn do người dùng thực hiện bằng cách nhấn nút hủy gia hạn
/// trong danh sách gói đang ký.
///
/// Hủy gia hạn đồng nghĩa với cập nhật lại trạng thái của gói đăng ký hiện tại
/// (currentSubscription) status = cancelExtend
///
/// Đăng ký gia hạn -> status = actived
///
class AutoExtends {
  final CurrentSubscriptionRepository currentSubscriptionRepository;
  final TakeCurrentUser takeCurrentUser;

  const AutoExtends({
    required this.currentSubscriptionRepository,
    required this.takeCurrentUser,
  });

  Future<AutoExtendActionResult> call(
      Subscription subscription, bool turnOn) async {
    final user = takeCurrentUser();
    if (user == null) {
      return AutoExtendActionResult.needSignIn;
    }
    // await subscriptionRepository.insert(uid, subscription);
    final success = await currentSubscriptionRepository.update(
      user.uidInFirestore,
      subscription.copyWith(
        status: turnOn
            ? SubscriptionStatus.actived
            : SubscriptionStatus.cancelExtend,
      ),
      true,
    );
    if (success) {
      return AutoExtendActionResult.success;
    }
    return AutoExtendActionResult.unknownError;
  }
}
