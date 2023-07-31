// import 'package:flutter/material.dart';

// import '../../../../entity/storage_plan.dart';
// import '../../../style/storage_plan_style.dart';

// class BottomActionAlone extends StatelessWidget {
//   const BottomActionAlone({
//     super.key,
//     required this.translate,
//     required this.style,
//     required this.plan,
//     required this.onSubscribe,
//   });
//   final String Function(String) translate;
//   final StoragePlanStyle style;
//   final StoragePlan plan;
//   final void Function(StoragePlan) onSubscribe;

//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(
//         onPressed: () => onSubscribe(plan),
//         child: Text('${translate('subscribePackage')} ${plan.title}'));
//   }
// }
