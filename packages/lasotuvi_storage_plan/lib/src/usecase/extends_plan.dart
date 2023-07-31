import 'dart:async';

import '../entity/extends_plan_action_result.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

///
/// Gia hạn gói hiện tại. Việc này thực hiện tự động bởi hệ thống, hoặc bởi người dùng
///
/// Hệ thống thực hiện tự động khi kiểm tra thấy đã hết hạn (expired),
/// và trạng thái gói hiện tại là actived. Khi việc gia hạn không thành công,
/// gói được chuyển sang trạng thái expired.
///
/// Người dùng thực hiện thủ công khi gói đã hết hạn nhưng chưa bị hủy,
/// lúc này trạng thái gói là expired.
class ExtendsPlan {
  const ExtendsPlan({
    required this.takeCurrentUser,
    required this.pay,
    required this.ableToPay,
    required this.updateCurrentSubscription,
  });
  final TakeCurrentUser takeCurrentUser;
  final UpdateCurrentSubscription updateCurrentSubscription;
  final FutureOr<bool> Function(String uid, int value) pay;
  final FutureOr<bool> Function(String uid, int value) ableToPay;

  Future<ExtendsPlanActionResult> call(Subscription subscription) async {
    final user = takeCurrentUser();
    if (user == null) {
      return ExtendsPlanActionResult.needSignIn;
    }

    if (!await ableToPay(user.uidInFirestore, subscription.energy)) {
      return ExtendsPlanActionResult.notEnoughEnergy;
    }
    final success = await pay(user.uidInFirestore, subscription.energy);
    if (!success) {
      return ExtendsPlanActionResult.paymentFailed;
    }

    await updateCurrentSubscription(
      user.uidInFirestore,
      subscription
          .extendExpiredDate(TimeConfig.expiredDuration)
          .addToTotal(subscription.energy),
    );

    return ExtendsPlanActionResult.success;
  }
}
