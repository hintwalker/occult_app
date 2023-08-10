import 'dart:async';

import 'package:flutter/material.dart';
import '../../entity/extends_plan_action_result.dart';
import '../../entity/stop_auto_extend_action_result.dart';
import '../../usecase/cancel_plan.dart';
import '../../usecase/extends_plan.dart';
import '../../entity/subscribe_action_result.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../entity/storage_plan.dart';
import '../../usecase/make_current_subscription_expired.dart';
import '../../usecase/auto_extends.dart';
import '../../usecase/subscribe_plan.dart';
import '../../usecase/take_all_storage_plans.dart';
import '../../usecase/take_storage_plan_by_id.dart';

class StoragePlanListController extends ChangeNotifier {
  StoragePlanListController({
    required this.subscribePlan,
    required this.autoExtends,
    required this.takeAllStoragePlans,
    required this.extendsPlan,
    required this.lastCanceledSubscription,
    required this.makeCurrentSubscriptionExpired,
    required this.cancelPlan,
    required this.takeStoragePlanById,
    // required this.subscribePlan,
    // required this.extendsSubscription,
    // // required this.hasConnection,
    // required this.takeCurrentUser,
    // required this.pay,
    // required this.ableToPay,

    // required this.takeCurrentSub,
    // this.registeredPlanId,
  });
  final SubscribePlan subscribePlan;
  final AutoExtends autoExtends;
  final TakeAllStoragePlans takeAllStoragePlans;
  final ExtendsPlan extendsPlan;
  final TakeLastCanceledSubscription lastCanceledSubscription;
  final MakeCurrentSubscriptionExpired makeCurrentSubscriptionExpired;
  final CancelPlan cancelPlan;
  final TakeStoragePlanById takeStoragePlanById;
  // final InsertSubscription subscribePlan;
  // final ExtendsSubscription extendsSubscription;
  // // final FutureOr<bool> Function() hasConnection;
  // final TakeCurrentUser takeCurrentUser;
  // final TakeCurrentSubscription takeCurrentSub;
  // final FutureOr<bool> Function(String uid, int value) pay;
  // final FutureOr<bool> Function(String uid, int value) ableToPay;

  // String? registeredPlanId;
  // Iterable<StoragePlan> plans = [];

  Future<StoragePlan?> takeCurrentPlan(String? uid, String planId) async {
    return await takeStoragePlanById(uid, planId);
  }

  Future<SubscribeActionResult> subscribe(StoragePlan plan) async {
    return await subscribePlan(plan);
    // // final connected = await hasConnection();
    // final user = takeCurrentUser();
    // if (user == null) {
    //   return SubscribeActionResult.needSignIn;
    // }
    // // Kiem tra goi dang ky dang su dung
    // final currentSub = await takeCurrentSub(user.uidInFirestore);
    // final payValue = _getMustPayValue(plan, currentSub);

    // if (!await ableToPay(user.uidInFirestore, payValue)) {
    //   return SubscribeActionResult.notEnoughEnergy;
    // }
    // final success = await pay(user.uidInFirestore, payValue);
    // if (!success) {
    //   return SubscribeActionResult.paymentFailed;
    // }
    // final today = DateTime.now();
    // final subscription = Subscription(
    //   id: today.millisecondsSinceEpoch,
    //   planId: plan.id,
    //   beginDate: today,
    //   expiredDate: today.add(TimeConfig.expiredDuration),
    //   timeZoneOffset: today.timeZoneOffset,
    //   total: plan.energy,
    //   energy: plan.energy,
    //   status: SubscriptionStatus.actived,
    // );
    // await subscribePlan(
    //   user.uidInFirestore,
    //   subscription,
    // );
    // return SubscribeActionResult.success;
  }

  Future<ExtendsPlanActionResult> extendsCurrentSub(
      Subscription subscription) async {
    if (subscription.status != SubscriptionStatus.canceled) {
      return await extendsPlan(subscription);
    }
    return ExtendsPlanActionResult.unknownError;

    // final user = takeCurrentUser();
    // if (user == null) {
    //   return SubscribeActionResult.needSignIn;
    // }

    // if (!await ableToPay(user.uidInFirestore, subscription.energy)) {
    //   return SubscribeActionResult.notEnoughEnergy;
    // }
    // final success = await pay(user.uidInFirestore, subscription.energy);
    // if (!success) {
    //   return SubscribeActionResult.paymentFailed;
    // }

    // // final connected = await hasConnection();

    // await extendsSubscription.call(user.uidInFirestore, subscription);
    // return SubscribeActionResult.success;
  }

  Future<AutoExtendActionResult> continueExtends(Subscription subscription) =>
      autoExtends(subscription, true);

  Future<AutoExtendActionResult> unSubscribe(Subscription subscription) async {
    // final connected = await hasConnection();
    // final user = takeCurrentUser();
    // if (user == null) {
    //   return SubscribeActionResult.needSignIn;
    // }
    return await autoExtends(subscription, false);
    // return SubscribeActionResult.success;
    // unSubscribePlan.call(user.uidInFirestore);
  }

  // Future<void> initialize({String? uid, String? registeredPlanId}) async {
  //   plans = await _loadAllPlans(uid);
  //   this.registeredPlanId = registeredPlanId;
  //   initializing = false;
  //   notifyListeners();
  // }

  // void setRegisteredPlan(String id) {
  //   registeredPlanId = id;
  //   notifyListeners();
  // }

  Future<Iterable<StoragePlan>> allPlans(String? uid) async {
    return await takeAllStoragePlans(uid);
  }
}
