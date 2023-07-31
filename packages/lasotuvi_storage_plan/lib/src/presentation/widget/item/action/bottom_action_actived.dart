// import 'package:flutter/material.dart';
// import 'package:tauari_subscription/tauari_subscription.dart';

// import '../../../../entity/storage_plan.dart';
// import '../../../../entity/storage_plan_ids.dart';
// import '../../../controller/expired_timer_controller.dart';
// import '../../../style/storage_plan_style.dart';
// import '../../timer/timer_value_widget.dart';

// class BottomActionActived extends StatelessWidget {
//   const BottomActionActived(
//     this.subscription, {
//     super.key,
//     required this.translate,
//     required this.style,
//     required this.expiredTimerController,
//     required this.plan,
//     required this.onUnsubscribe,
//   });
//   final String Function(String) translate;
//   final StoragePlanStyle style;
//   final Subscription subscription;
//   final ExpiredTimerController expiredTimerController;
//   final StoragePlan plan;
//   final void Function() onUnsubscribe;

//   @override
//   Widget build(BuildContext context) {
//     return plan.id == StoragePlanIds.free
//         ? Text(translate('using'), style: style.using)
//         : Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Text(
//                 translate('msgNextPaymentTitle'),
//                 style: style.nextPaymentTitle,
//               ),
//               TimerValueWidget(subscription,
//                   translate: translate,
//                   controller: expiredTimerController,
//                   style: style),
//               OutlinedButton(
//                 onPressed: onUnsubscribe,
//                 style: style.cancelButton,
//                 child: Text('${translate('unsubscribe')} ${plan.title}'),
//               )
//             ],
//           );
//   }
// }
