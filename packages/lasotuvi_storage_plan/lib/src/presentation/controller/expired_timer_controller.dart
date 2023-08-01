import 'dart:async';

// import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/lasotuvi_storage_plan.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

class ExpiredTimerController extends ChangeNotifier {
  ExpiredTimerController(
      // {
      // required this.updateCurrentSub,
      // required this.extendsSubscription,
      // required this.cancelPlan,
      // }
      );
  // final UpdateCurrentSubscription updateCurrentSub;
  // final ExtendsPlan extendsSubscription;
  // final CancelPlan cancelPlan;

  Future<bool> Function(Subscription, bool openExtendsConfirm)?
      _listenerOnExpired;
  void Function(Subscription)? _listenerOnCanceled;

  void addListenerOnExpired(
      Future<bool> Function(Subscription, bool openExtendsConfirm) listener) {
    _listenerOnExpired = listener;
  }

  void addListenerOnCanceled(void Function(Subscription) listener) {
    _listenerOnCanceled = listener;
  }

  Duration duration = Duration.zero;
  // Duration extendTime = Duration.zero;
  // Duration cancelDuration = if(k;
  Timer? expiredTimer;
  Timer? canceledTimer;

  int get days => duration.inDays;
  int get hours => duration.inHours % 24;
  int get minutes => duration.inMinutes % 60;
  int get seconds => (duration.inSeconds % 3600) % 60;

  // String? status;

  void setDuration(Duration value) {
    duration = value;
    notifyListeners();
  }

  void startExpiredTimer(
    Subscription subscription,
  ) async {
    if (subscription.planId == StoragePlanIds.free) {
      return;
    }
    duration = subscription.expiredDate.difference(DateTime.now());

    if (isCanceled(subscription)) {
      await onCanceled(
        subscription,
      );
      return;
    } else if (isEndTime(duration)) {
      if (subscription.status != SubscriptionStatus.expired) {
        final openExtendsConfirm =
            subscription.status != SubscriptionStatus.cancelExtend;
        final willExpired = await onExpired(
          subscription,
          openExtendsConfirm,
        );
        if (willExpired) {
          return;
        }
      }

      startCanceledTimer(subscription);
      return;
    }
    const oneSec = Duration(seconds: 1);
    expiredTimer = Timer.periodic(oneSec, (timer) async {
      if (isEndTime(duration)) {
        timer.cancel();
        // if (!await onExpired(subscription)) {
        //   startCanceledTimer(subscription);
        // }
        if (subscription.status != SubscriptionStatus.expired) {
          final openExtendsConfirm =
              subscription.status != SubscriptionStatus.cancelExtend;
          final willExpired = await onExpired(
            subscription,
            openExtendsConfirm,
          );
          if (willExpired) {
            return;
          }
        }
        startCanceledTimer(subscription);
      } else {
        // status = SubscriptionStatus.actived;
        setDuration(duration - oneSec);
      }
    });
  }

  bool isCanceled(Subscription subscription) {
    final duration =
        subscription.expiredDate.add(TimeConfig.cancelDuration).difference(
              DateTime.now(),
            );
    return isEndTime(duration);
  }

  bool isEndTime(Duration duration) =>
      duration.isNegative || duration == Duration.zero;

  void cancelExpiredTimer() {
    if (expiredTimer != null) {
      if (expiredTimer!.isActive) {
        expiredTimer!.cancel();
      }
    }
  }

  void cancelCanceledTimer() {
    if (canceledTimer != null) {
      if (canceledTimer!.isActive) {
        canceledTimer!.cancel();
      }
    }
  }

  void cancelAllTimer() {
    cancelExpiredTimer();
    cancelCanceledTimer();
  }

  void startCanceledTimer(Subscription subscription) {
    const oneSec = Duration(seconds: 1);
    final endDate = subscription.expiredDate.add(TimeConfig.cancelDuration);
    duration = endDate.difference(DateTime.now());
    if (isEndTime(duration)) {
      // status = SubscriptionStatus.canceled;
      // notifyListeners();
      onCanceled(subscription);
      return;
    }
    canceledTimer = Timer.periodic(oneSec, (timer) {
      if (isEndTime(duration)) {
        timer.cancel();

        // status = SubscriptionStatus.canceled;
        // notifyListeners();
        onCanceled(subscription);
      } else {
        // status = SubscriptionStatus.expired;
        setDuration(duration - oneSec);
      }
    });
  }

  @override
  void dispose() {
    cancelAllTimer();
    super.dispose();
  }

  Future<bool> onExpired(
      Subscription subscription, bool openExtendsConfirm) async {
    if (_listenerOnExpired != null) {
      return await _listenerOnExpired!(subscription, openExtendsConfirm);
    }
    return false;
    // Cần kiểm tra status của subscription có tự động gia hạn không?
    // Nếu có thì tự động gia hạn, giữ nguyên trạng thái actived
    // Nếu không thì chuyển trạng thái sang expired
    // Khi gia hạn cần kiểm tra đủ số điểm năng lượng,

    // if (subscription.status == SubscriptionStatus.actived) {
    //   final extendsResult = await extendsSubscription(subscription);
    //   switch (extendsResult) {
    //     case ExtendsPlanActionResult.:

    //       break;
    //     default:
    //   }
    //   // await updateCurrentSub(
    //   //     uid, subscription.copyWith(status: SubscriptionStatus.expired));
    //   // if (kDebugMode) {
    //   //   print('Save expired');
    //   // }
    // }
  }

  Future<void> onCanceled(Subscription subscription) async {
    if (_listenerOnCanceled != null) {
      _listenerOnCanceled!(subscription);
    }
    // if (subscription.status != SubscriptionStatus.canceled) {
    //   await updateCurrentSub(
    //       uid, subscription.copyWith(status: SubscriptionStatus.canceled));
    //   if (kDebugMode) {
    //     print('Save canceled');
    //   }
    // }
  }
}
