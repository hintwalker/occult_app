import 'package:flutter/material.dart';
// import 'package:tauari_ui/tauari_ui.dart';
import 'plan_list_item_wrapper.dart';
import 'package:tauari_subscription/tauari_subscription.dart';

import '../../../entity/storage_plan.dart';
// import '../../../entity/storage_plan_ids.dart';
import '../../controller/expired_timer_controller.dart';
import '../../controller/storage_plan_list_controller.dart';
import '../../style/storage_plan_style.dart';
// import 'storage_plan_list_item.dart';

class StoragePlanList extends StatelessWidget {
  const StoragePlanList({
    super.key,
    required this.plans,
    // this.activedPlanId,
    // this.previousPlanId,
    // required this.onRegister,
    required this.translate,
    required this.energyIcon,
    required this.style,
    required this.expiredTimerController,
    required this.subscription,
    required this.lastCanceled,
    required this.controller,
    // this.uid,
  });
  final Iterable<StoragePlan> plans;
  // final String? activedPlanId;
  // final String? previousPlanId;
  // final void Function(StoragePlan plan) onRegister;
  final String Function(String) translate;
  final Widget energyIcon;
  final StoragePlanStyle style;
  final ExpiredTimerController expiredTimerController;
  final StoragePlanListController controller;
  final Subscription subscription;
  final Subscription? lastCanceled;
  // final String? uid;
  // final Widget timer;

  // bool isRegistered(String docId) => activedPlanId == docId;
  // bool shouldDisplayPrevious(String docId) =>
  //     activedPlanId == StoragePlanIds.free && previousPlanId == docId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.only(bottom: 92.0),
        itemCount: plans.length,
        itemBuilder: (ctx, index) {
          // final docId = plans.elementAt(index).docId;
          return PlanListItemWrapper(
            currentSubscription: subscription,
            lastCanceled: lastCanceled,
            style: style,
            translate: translate,
            timerController: expiredTimerController,
            energyIcon: energyIcon,
            plan: plans.elementAt(index),
            planController: controller,
          );
        });
  }

  // @override
  // State<StatefulWidget> createState() => _StoragePlanListState();

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //       padding: const EdgeInsets.only(bottom: 92.0),
  //       itemCount: plans.length,
  //       itemBuilder: (ctx, index) {
  //         // final docId = plans.elementAt(index).docId;
  //         return PlanListItemWrapper(
  //           currentSubscription: subscription,
  //           lastCanceled: lastCanceled,
  //           style: style,
  //           translate: translate,
  //           timerController: expiredTimerController,
  //           energyIcon: energyIcon,
  //           plan: plans.elementAt(index),
  //           controller: controller,
  //         );
  //         // return StoragePlanListItem(
  //         //   item: plans.elementAt(index),
  //         //   actived: isRegistered(docId),
  //         //   // onItemTap: onRegister,
  //         //   translate: translate,
  //         //   energyIcon: energyIcon,
  //         //   timer: expiredTimerController, //isRegistered(docId) ? timer : null,
  //         //   shouldDisplayPrevious: shouldDisplayPrevious(docId),
  //         //   style: style,
  //         //   subscription: subscription,
  //         //   controller: controller,
  //         //   // uid: uid,
  //         // );
  //       });
  //   // return FutureBuilder(
  //   //     future: controller.allStoragePlans(uid),
  //   //     builder: (ctx, snapshot) {
  //   //       if (snapshot.connectionState == ConnectionState.waiting) {
  //   //         return const Center(child: CircularProgressIndicator());
  //   //       } else if (snapshot.hasData) {
  //   //         final data = snapshot.requireData;
  //   //         return ListView.builder(
  //   //           itemCount: data.length,
  //   //           itemBuilder: (ctx, index) {
  //   //           return StoragePlanListItem(
  //   //               item: data.elementAt(index));
  //   //         });
  //   //       } else {
  //   //         return const Center(child: Text('!'));
  //   //       }
  //   //     });
  // }
}

// class _StoragePlanListState extends State<StoragePlanList> {
//   @override
//   void initState() {
//     super.initState();
//     // widget.expiredTimerController.addListenerOnExpired(listenToExpired);

//     // widget.expiredTimerController.addListenerOnCanceled((p0) {
//     //   widget.controller.cancelPlan.call(p0);
//     // });
//   }

//   // Future<bool> listenToExpired(Subscription subscription) async {
//   //   final result = await showDialog<ConfirmResult>(
//   //     context: context,
//   //     builder: (ctx) => const BasicConfirmDialog(
//   //       title: '',
//   //       cancelButtonText: null,
//   //       noButtonText: 'No',
//   //       yesButtonText: 'Extends',
//   //       children: [Text('extends?')],
//   //     ),
//   //   );
//   //   if (result == null) {
//   //     await widget.controller.makeCurrentSubscriptionExpired(subscription);
//   //   } else if (result.yes) {
//   //     await widget.controller.extendsCurrentSub(subscription);
//   //     return true;
//   //   } else {
//   //     await widget.controller.makeCurrentSubscriptionExpired(subscription);
//   //   }
//   //   return false;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         padding: const EdgeInsets.only(bottom: 92.0),
//         itemCount: widget.plans.length,
//         itemBuilder: (ctx, index) {
//           // final docId = plans.elementAt(index).docId;
//           return PlanListItemWrapper(
//             currentSubscription: widget.subscription,
//             lastCanceled: widget.lastCanceled,
//             style: widget.style,
//             translate: widget.translate,
//             timerController: widget.expiredTimerController,
//             energyIcon: widget.energyIcon,
//             plan: widget.plans.elementAt(index),
//             planController: widget.controller,
//           );
//         });
//   }
// }
