// import 'package:flutter/material.dart';
// import 'package:tauari_subscription/tauari_subscription.dart';

// import '../../entity/storage_plan.dart';
// import '../controller/expired_timer_controller.dart';
// import '../controller/storage_plan_list_controller.dart';
// import '../style/storage_plan_style.dart';
// import 'item/action/bottom_action_with_timer.dart';
// import 'item/plan_property.dart';
// import 'item/plan_price.dart';
// import 'item/plan_title.dart';

// class StoragePlanListItem extends StatelessWidget {
//   const StoragePlanListItem({
//     super.key,
//     required this.item,
//     this.actived = false,
//     this.shouldDisplayPrevious = false,
//     // required this.onItemTap,
//     required this.translate,
//     required this.energyIcon,
//     required this.style,
//     required this.timer,
//     required this.subscription,
//     required this.controller,
//   });
//   final StoragePlan item;
//   final bool actived;
//   // final void Function(StoragePlan plan) onItemTap;
//   final String Function(String) translate;
//   final Widget energyIcon;
//   final ExpiredTimerController timer;
//   final bool shouldDisplayPrevious;
//   final StoragePlanStyle style;
//   final Subscription subscription;
//   final StoragePlanListController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 16.0),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               PlanTitle(item, style: style),
//               const SizedBox(
//                 height: 8.0,
//               ),
//               PlanPrice(item,
//                   translate: translate, energyIcon: energyIcon, style: style),
//               PlanProperty(
//                 item,
//                 translate: translate,
//                 style: style,
//               ),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               //   children: [
//               //     PlanDetailItem(
//               //         title: translate('chart'),
//               //         value: item.limitChart.toString()),
//               //     PlanDetailItem(
//               //         title: translate('note'), value: item.limitNote.toString()),
//               //     PlanDetailItem(
//               //         title: translate('tag'), value: item.limitTag.toString())
//               //   ],
//               // ),
//               const SizedBox(
//                 height: 24.0,
//               ),

//               BottomActionWithTimer(
//                   subscription: subscription,
//                   style: style,
//                   translate: translate,
//                   expiredTimerController: timer,
//                   plan: item,
//                   controller: controller)

//               // !actived
//               //     ? FilledButton(
//               //         onPressed: () => onItemTap(item),
//               //         child: Text(
//               //           translate('register'),
//               //         ),
//               //       )
//               //     : Column(
//               //         crossAxisAlignment: CrossAxisAlignment.center,
//               //         mainAxisSize: MainAxisSize.min,
//               //         children: [
//               //             Text(translate('registered')),
//               //             const SizedBox(
//               //               height: 8.0,
//               //             ),
//               //             // if (timer != null) timer!
//               //           ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
