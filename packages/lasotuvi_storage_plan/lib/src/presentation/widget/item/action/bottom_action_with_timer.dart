// import 'package:flutter/material.dart';
// import 'package:tauari_subscription/tauari_subscription.dart';

// import '../../../../entity/storage_plan.dart';
// import '../../../../entity/storage_plan_ids.dart';
// import '../../../../entity/storage_plan_status.dart';
// import '../../../controller/expired_timer_controller.dart';
// import '../../../controller/storage_plan_list_controller.dart';
// import '../../../style/storage_plan_style.dart';
// import 'bottom_action_actived.dart';
// import 'bottom_action_canceled.dart';
// import 'bottom_action_expired.dart';
// import 'bottom_action_alone.dart';

// class BottomActionWithTimer extends StatelessWidget {
//   const BottomActionWithTimer({
//     super.key,
//     required this.subscription,
//     required this.style,
//     required this.translate,
//     required this.expiredTimerController,
//     required this.plan,
//     required this.controller,
//     // this.uid,
//   });
//   final Subscription subscription;
//   final String Function(String) translate;
//   final StoragePlanStyle style;
//   final ExpiredTimerController expiredTimerController;
//   final StoragePlan plan;
//   final StoragePlanListController controller;
//   // final String? uid;

//   @override
//   Widget build(BuildContext context) {
//     final status = checkStatus(subscription, plan);
//     if (status == StoragePlanStatus.alone) {
//       return BottomActionAlone(
//           translate: translate,
//           style: style,
//           plan: plan,
//           onSubscribe: (plan) => onSubscribe(plan, context));
//     } else if (status == StoragePlanStatus.actived) {
//       return BottomActionActived(subscription,
//           translate: translate,
//           style: style,
//           expiredTimerController: expiredTimerController,
//           plan: plan,
//           onUnsubscribe: () => onUnsubscribe(context, subscription));
//     } else if (status == StoragePlanStatus.canceled) {
//       return BottomActionCanceled(subscription,
//           translate: translate,
//           style: style,
//           plan: plan,
//           onSubscribe: (plan) => onSubscribe(plan, context));
//     } else if (status == StoragePlanStatus.expired) {
//       return BottomActionExpired(subscription,
//           translate: translate,
//           style: style,
//           expiredTimerController: expiredTimerController,
//           plan: plan,
//           onExtends: () => onExtends(context));
//     } else {
//       return BottomActionAlone(
//           translate: translate,
//           style: style,
//           plan: plan,
//           onSubscribe: (plan) => onSubscribe(plan, context));
//     }
//     //   return subscription.status == SubscriptionStatus.actived
//     //       ? subscription.packageId == plan.id
//     //           ? BottomActionActived(subscription,
//     //               translate: translate,
//     //               style: style,
//     //               expiredTimerController: expiredTimerController,
//     //               plan: plan,
//     //               onUnsubscribe: () => onUnsubscribe(context))
//     //           : BottomActionAlone(
//     //               translate: translate,
//     //               style: style,
//     //               plan: plan,
//     //               onSubscribe: (plan) => onSubscribe(plan, context))
//     //       : subscription.status == SubscriptionStatus.expired
//     //           ? subscription.packageId == plan.id
//     //               ? BottomActionExpired(subscription,
//     //                   translate: translate,
//     //                   style: style,
//     //                   expiredTimerController: expiredTimerController,
//     //                   plan: plan,
//     //                   onExtends: () => onExtends(context))
//     //               : subscription.packageId == StoragePlanIds.free
//     //                   ? BottomActionActived(subscription,
//     //                       translate: translate,
//     //                       style: style,
//     //                       expiredTimerController: expiredTimerController,
//     //                       plan: plan,
//     //                       onUnsubscribe: () => onUnsubscribe(context))
//     //                   : BottomActionAlone(
//     //                       translate: translate,
//     //                       style: style,
//     //                       plan: plan,
//     //                       onSubscribe: (plan) => onSubscribe(plan, context))
//     //           : subscription.status == SubscriptionStatus.canceled
//     //               ? plan.id == StoragePlanIds.free
//     //                   ? BottomActionActived(subscription,
//     //                       translate: translate,
//     //                       style: style,
//     //                       expiredTimerController: expiredTimerController,
//     //                       plan: plan,
//     //                       onUnsubscribe: () => onUnsubscribe(context))
//     //                   : subscription.packageId == plan.id
//     //                       ? BottomActionCanceled(subscription,
//     //                           translate: translate,
//     //                           style: style,
//     //                           plan: plan,
//     //                           onSubscribe: (plan) => onSubscribe(plan, context))
//     //                       : BottomActionAlone(
//     //                           translate: translate,
//     //                           style: style,
//     //                           plan: plan,
//     //                           onSubscribe: (plan) => onSubscribe(plan, context))
//     //               : BottomActionAlone(
//     //                   translate: translate,
//     //                   style: style,
//     //                   plan: plan,
//     //                   onSubscribe: (plan) => onSubscribe(plan, context));
//   }

//   String checkStatus(Subscription subscription, StoragePlan plan) {
//     if (subscription.planId != plan.id) {
//       return statusOfOtherPlan(subscription, plan);
//     } else {
//       return statusOfTargetPlan(subscription, plan);
//     }
//   }

//   String statusOfOtherPlan(Subscription subscription, StoragePlan plan) {
//     if (subscription.status == SubscriptionStatus.canceled &&
//         plan.id == StoragePlanIds.free) {
//       return StoragePlanStatus.actived;
//     } else {
//       return StoragePlanStatus.alone;
//     }
//   }

//   String statusOfTargetPlan(Subscription subscription, StoragePlan plan) {
//     final data = {
//       SubscriptionStatus.actived: StoragePlanStatus.actived,
//       SubscriptionStatus.canceled: StoragePlanStatus.canceled,
//       // SubscriptionStatus.waitingCancel: StoragePlanStatus.waitingCancel,
//       SubscriptionStatus.expired: StoragePlanStatus.expired,
//     };
//     if (plan.id == StoragePlanIds.free) {
//       return StoragePlanStatus.actived;
//     } else {
//       return data[subscription.status]!;
//     }
//   }

//   void onUnsubscribe(BuildContext context, Subscription subscription) {
//     showDialog(
//         context: context,
//         builder: (ctx) {
//           return AlertDialog(
//             title: Text(translate('confirm')),
//             content: Text(translate('msgUnsubscribe')),
//             actions: [
//               // The "Yes" button

//               TextButton(
//                   onPressed: () {
//                     // Close the dialog
//                     Navigator.of(ctx).pop();
//                   },
//                   child: Text(translate('no'))),
//               OutlinedButton(
//                   onPressed: () async {
//                     await controller.unSubscribe(subscription);

//                     // Close the dialog
//                     if (ctx.mounted) {
//                       Navigator.of(ctx).pop();
//                     }
//                   },
//                   child: Text(translate('unSubscribe'))),
//             ],
//           );
//         });
//   }

//   void onSubscribe(StoragePlan plan, BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (ctx) {
//           return AlertDialog(
//             title: Text(translate('confirm')),
//             content: Text(translate('msgSubscribe')),
//             actions: [
//               // The "Yes" button

//               TextButton(
//                   onPressed: () {
//                     // Close the dialog
//                     Navigator.of(ctx).pop();
//                   },
//                   child: Text(translate('no'))),
//               FilledButton(
//                   onPressed: () async {
//                     await controller.subscribe(plan);

//                     // Close the dialog
//                     if (ctx.mounted) {
//                       Navigator.of(ctx).pop();
//                     }
//                   },
//                   child: Text(translate('subscribe'))),
//             ],
//           );
//         });
//   }

//   void onExtends(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (ctx) {
//           return AlertDialog(
//             title: Text(translate('confirm')),
//             content: Text(translate('msgExtends')),
//             actions: [
//               // The "Yes" button
//               TextButton(
//                   onPressed: () async {
//                     await controller.extendsCurrentSub(subscription);

//                     // Close the dialog
//                     if (ctx.mounted) {
//                       Navigator.of(ctx).pop();
//                     }
//                   },
//                   child: const Text('Yes')),
//               TextButton(
//                   onPressed: () {
//                     // Close the dialog
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('No'))
//             ],
//           );
//         });
//   }
// }
