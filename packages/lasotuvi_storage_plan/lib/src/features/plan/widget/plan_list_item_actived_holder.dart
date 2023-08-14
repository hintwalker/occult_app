import 'package:flutter/material.dart';
import 'package:lasotuvi_storage_plan/src/features/plan/style/plan_list_item_style.dart';
import 'package:lasotuvi_storage_plan/src/features/plan/widget/plan_list_item_actived_signal.dart';

class PlanListItemActivedHolder extends StatelessWidget {
  const PlanListItemActivedHolder({
    super.key,
    required this.child,
    required this.style,
    required this.translate,
  });
  final Widget child;
  final PlanListItemStyle style;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24.0),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: style.activedSinalBorderColor ?? Colors.black87,
                width: 4.0,
              ),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12.0),
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: child,
          ),
          Positioned(
            child: PlanListItemActivedSignal(
              translate: translate,
              backgroundColor: style.activedSignalBackground,
              textStyle: style.activedSignalTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
