import 'dart:async';

import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../entity/storage_plan.dart';
import '../entity/storage_plan_ids.dart';
import '../entity/subscribe_action_result.dart';

///
/// Đăng ký gói mới, nâng cấp, hạ cấp.
///
/// Tùy thuộc vào mối quan hệ giữa gói đang sử dụng, và gói đăng ký mới,
/// mà việc đăng ký là đăng ký mới hay nâng cấp hoặc hạ cấp.
///
/// Các bước thực hiện:
/// - Lấy điểm năng lượng cần chi trả, giá trị có thể là số âm,
/// khi đó việc đăng ký là hạ cấp.
/// - Kiểm tra người dùng có đủ chi trả không
/// - Thực hiện thanh toán
///
class SubscribePlan {
  const SubscribePlan({
    required this.takeCurrentUser,
    required this.takeCurrentSubscription,
    required this.insertSubscription,
    required this.ableToPay,
    required this.pay,
  });
  final TakeCurrentUser takeCurrentUser;
  final TakeCurrentSubscription takeCurrentSubscription;
  final InsertSubscription insertSubscription;
  final FutureOr<bool> Function(String uid, int value) pay;
  final FutureOr<bool> Function(String uid, int value) ableToPay;
  Future<SubscribeActionResult> call(StoragePlan plan) async {
    final user = takeCurrentUser();
    if (user == null) {
      return SubscribeActionResult.needSignIn;
    }

    final currentSub = await takeCurrentSubscription(user.uidInFirestore);
    final payValue = _getMustPayValue(plan, currentSub);

    if (!await ableToPay(user.uidInFirestore, payValue)) {
      return SubscribeActionResult.notEnoughEnergy;
    }

    final success = await pay(user.uidInFirestore, payValue);
    if (!success) {
      return SubscribeActionResult.paymentFailed;
    }
    final today = DateTime.now();
    final subscription = Subscription(
      id: today.millisecondsSinceEpoch,
      planId: plan.id,
      beginDate: today,
      expiredDate: today.add(TimeConfig.expiredDuration),
      timeZoneOffset: today.timeZoneOffset,
      total: plan.energy,
      energy: plan.energy,
      status: SubscriptionStatus.actived,
    );
    await insertSubscription(
      user.uidInFirestore,
      subscription,
    );
    return SubscribeActionResult.success;
  }

  int _getMustPayValue(StoragePlan plan, Subscription? currentSub) {
    if (currentSub == null || currentSub.planId == StoragePlanIds.free) {
      return plan.energy;
    }
    // Nếu đã hết hạn thì trả về giá của plan
    if (_hasExpired(currentSub)) {
      return plan.energy;
    }
    // Tính điểm năng lượng tương ứng với passedTime
    final passedEnergy = _getPassedEnergy(currentSub);
    return plan.energy - passedEnergy;
  }

  bool _hasExpired(Subscription currentSub) {
    return DateTime.now().isBefore(currentSub.expiredDate);
  }

  int _getPassedEnergy(Subscription currentSub) {
    // Tính thời gian đã sử dụng
    final passedDays = _getPassedTimeInDay(currentSub);
    if (TimeConfig.expiredDuration.inDays == 0) {
      return 0;
    }
    return (currentSub.energy / TimeConfig.expiredDuration.inDays).floor() *
        passedDays;
  }

  int _getPassedTimeInDay(Subscription currentSub) {
    return DateTime.now()
        .difference(currentSub.expiredDate.subtract(TimeConfig.expiredDuration))
        .inDays;
  }
}
