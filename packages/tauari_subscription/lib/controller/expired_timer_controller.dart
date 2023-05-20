part of tauari_subscription;

class ExpiredTimerController extends ChangeNotifier {
  ExpiredTimerController(this.updateCurrentSub);
  final UpdateCurrentSub updateCurrentSub;
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
    String? uid,
  ) {
    duration = subscription.expiredDate.difference(DateTime.now());
    if (isEndTime(duration)) {
      onExpired(subscription, uid);
      startCanceledTimer(subscription, uid);
      return;
    }
    const oneSec = Duration(seconds: 1);
    expiredTimer = Timer.periodic(oneSec, (timer) {
      if (isEndTime(duration)) {
        timer.cancel();
        onExpired(subscription, uid);
        startCanceledTimer(subscription, uid);
      } else {
        // status = SubscriptionStatus.actived;
        setDuration(duration - oneSec);
      }
    });
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

  void startCanceledTimer(
    Subscription subscription,
    String? uid,
  ) {
    const oneSec = Duration(seconds: 1);
    final endDate = subscription.expiredDate.add(kDebugMode
        ? TimeConfig.debugCancelDuration
        : TimeConfig.cancelDuration);
    duration = endDate.difference(DateTime.now());
    if (isEndTime(duration)) {
      // status = SubscriptionStatus.canceled;
      // notifyListeners();
      onCanceled(subscription, uid);
      return;
    }
    canceledTimer = Timer.periodic(oneSec, (timer) {
      if (isEndTime(duration)) {
        timer.cancel();

        // status = SubscriptionStatus.canceled;
        // notifyListeners();
        onCanceled(subscription, uid);
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

  Future<void> onExpired(Subscription subscription, String? uid) async {
    if (subscription.status == SubscriptionStatus.actived) {
      await updateCurrentSub(
          uid, subscription.copyWith(status: SubscriptionStatus.expired));
      if (kDebugMode) {
        print('Save expired');
      }
    }
  }

  Future<void> onCanceled(Subscription subscription, String? uid) async {
    if (subscription.status != SubscriptionStatus.canceled) {
      await updateCurrentSub(
          uid, subscription.copyWith(status: SubscriptionStatus.canceled));
      if (kDebugMode) {
        print('Save canceled');
      }
    }
  }
}
