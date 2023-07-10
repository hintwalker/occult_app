import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tauari_auth/tauari_auth.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../entity/storage_plan.dart';
import '../../usecase/take_all_storage_plans.dart';

class StoragePlanListController extends ChangeNotifier {
  StoragePlanListController({
    required this.takeAllStoragePlans,
    required this.subscribePlan,
    required this.unSubscribePlan,
    required this.extendsSubscription,
    required this.hasConnection,
    required this.takeCurrentUser,
    // this.registeredPlanId,
  });
  final SubscribePlan subscribePlan;
  final UnSubscribePlan unSubscribePlan;
  final ExtendsSubscription extendsSubscription;
  final FutureOr<bool> Function() hasConnection;
  final TakeCurrentUser takeCurrentUser;

  // String? registeredPlanId;
  // Iterable<StoragePlan> plans = [];
  final TakeAllStoragePlans takeAllStoragePlans;

  Future<void> subscribe(StoragePlan plan) async {
    final connected = await hasConnection();
    final user = takeCurrentUser();
    if (connected && user != null) {
      final today = DateTime.now();
      final subscription = Subscription(
        id: today.millisecondsSinceEpoch,
        packageId: plan.id,
        beginDate: today,
        expiredDate: today.add(TimeConfig.expiredDuration),
        timeZoneOffset: today.timeZoneOffset,
        total: plan.energy,
        energy: plan.energy,
        status: SubscriptionStatus.actived,
      );
      await subscribePlan(
        user.uidInFirestore,
        subscription,
      );
    }
  }

  Future<void> extendsCurrentSub(Subscription subscription) async {
    final connected = await hasConnection();
    final user = takeCurrentUser();
    if (connected && user != null) {
      extendsSubscription.call(user.uidInFirestore, subscription);
    }
  }

  Future<void> unSubscribe() async {
    final connected = await hasConnection();
    final user = takeCurrentUser();
    if (connected && user != null) {
      unSubscribePlan.call(user.uidInFirestore);
    }
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
