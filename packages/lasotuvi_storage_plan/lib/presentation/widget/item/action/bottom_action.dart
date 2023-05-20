part of lasotuvi_storage_plan;

class BottomAction extends StatelessWidget {
  const BottomAction({
    super.key,
    required this.subscription,
    required this.style,
    required this.translate,
    required this.expiredTimerController,
    required this.plan,
    required this.controller,
    this.uid,
  });
  final Subscription subscription;
  final String Function(String) translate;
  final StoragePlanStyle style;
  final ExpiredTimerController expiredTimerController;
  final StoragePlan plan;
  final StoragePlanListController controller;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return subscription.status == SubscriptionStatus.actived
        ? subscription.packageId == plan.id
            ? BottomActionActived(subscription,
                translate: translate,
                style: style,
                expiredTimerController: expiredTimerController,
                plan: plan,
                onUnsubscribe: () => onUnsubscribe(context))
            : BottomActionUnActived(
                translate: translate,
                style: style,
                plan: plan,
                onSubscribe: (plan) => onSubscribe(plan, context))
        : subscription.status == SubscriptionStatus.expired
            ? subscription.packageId == plan.id
                ? BottomActionExpired(subscription,
                    translate: translate,
                    style: style,
                    expiredTimerController: expiredTimerController,
                    plan: plan,
                    onExtends: () => onExtends(context))
                : subscription.packageId == StoragePlanIds.free
                    ? BottomActionActived(subscription,
                        translate: translate,
                        style: style,
                        expiredTimerController: expiredTimerController,
                        plan: plan,
                        onUnsubscribe: () => onUnsubscribe(context))
                    : BottomActionUnActived(
                        translate: translate,
                        style: style,
                        plan: plan,
                        onSubscribe: (plan) => onSubscribe(plan, context))
            : subscription.status == SubscriptionStatus.canceled
                ? plan.id == StoragePlanIds.free
                    ? BottomActionActived(subscription,
                        translate: translate,
                        style: style,
                        expiredTimerController: expiredTimerController,
                        plan: plan,
                        onUnsubscribe: () => onUnsubscribe(context))
                    : subscription.packageId == plan.id
                        ? BottomActionCanceled(subscription,
                            translate: translate,
                            style: style,
                            plan: plan,
                            onSubscribe: (plan) => onSubscribe(plan, context))
                        : BottomActionUnActived(
                            translate: translate,
                            style: style,
                            plan: plan,
                            onSubscribe: (plan) => onSubscribe(plan, context))
                : BottomActionUnActived(
                    translate: translate,
                    style: style,
                    plan: plan,
                    onSubscribe: (plan) => onSubscribe(plan, context));
  }

  void onUnsubscribe(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(translate('confirm')),
            content: Text(translate('msgUnsubscribe')),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    await controller.unSubscribe();

                    // Close the dialog
                    if (ctx.mounted) {
                      Navigator.of(ctx).pop();
                    }
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  void onSubscribe(StoragePlan plan, BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(translate('confirm')),
            content: Text(translate('msgUnsubscribe')),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    await controller.subscribe(plan);

                    // Close the dialog
                    if (ctx.mounted) {
                      Navigator.of(ctx).pop();
                    }
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  void onExtends(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(translate('confirm')),
            content: Text(translate('msgExtends')),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () async {
                    await controller.extendsCurrentSub(subscription);

                    // Close the dialog
                    if (ctx.mounted) {
                      Navigator.of(ctx).pop();
                    }
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
}
